//
//  WordGameViewModel.swift
//  WordGame
//
//  Created by Erfan Andesta on 5/28/1401 AP.
//

import Foundation
import Combine

class WordGameViewModel {
    
    //MARK: - Properties -
    private let jsonLoader: JSONLoader
    private var correctWords = Set<WordPair>()
    private var cancellables = Set<AnyCancellable>()
    private weak var timer: Timer?
    let currentPair = CurrentValueSubject<WordPair?, Never>(nil)
    let guess = PassthroughSubject<Bool, Never>()
    let points = CurrentValueSubject<(wrong: Int, correct: Int), Never>((0, 0))
    
    //MARK: - Initializer -
    init(jsonLoader: JSONLoader = .init()) {
        self.jsonLoader = jsonLoader
        correctWords = loadWords()
        makeGame()
        
        
        guess
            .sink { isCorrect in
                let correctPoint = self.points.value.correct
                let wrongPoint = self.points.value.wrong
                if self.currentPair.value?.isCorrectTranslation == isCorrect {
                    self.points.send((wrong: wrongPoint, correct: correctPoint + 1))
                } else {
                    self.points.send((wrong: wrongPoint + 1, correct: correctPoint))
                }
                self.makeGame()
            }.store(in: &cancellables)
        
        points
            .sink { wrong, correct in
                let sum = wrong + correct
                if wrong == 3 || sum == 15 {
                    exit(0)
                }
            }.store(in: &cancellables)
    }
    
    //MARK: - Methods -
    private func loadWords() -> Set<WordPair> {
        return jsonLoader.load(file: "words", for: Self.self, model: Set<WordPair>.self) ?? []
    }
    private func makeTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            self.makeGame()
            self.points.send((wrong: self.points.value.wrong + 1, correct: self.points.value.correct))
        }
        timer?.tolerance = 0.2
    }
    private func makeGame() {
        let random = Int.random(in: 1...4)
        currentPair.send(makePair(isCorrect: random == 1))
        makeTimer()
    }
    private func makePair(isCorrect: Bool) -> WordPair? {
        guard let pair = correctWords.randomElement() else { return nil }
        if isCorrect {
            return pair
        } else {
            let words = correctWords.filter({ $0 != pair })
            guard let randomPair = words.randomElement() else { return nil }
            return WordPair(text: pair.text, translation: randomPair.translation, isCorrectTranslation: false)
        }
    }
}
