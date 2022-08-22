//
//  WordGameTests.swift
//  WordGameTests
//
//  Created by Erfan Andesta on 5/31/1401 AP.
//

import XCTest
import Combine
@testable import WordGame

class WordGameTests: XCTestCase {

    var navigator: WordGameNavigator!
    var viewModel: WordGameViewModelTest!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
        navigator = WordGameNavigator(window: UIWindow())
        viewModel = WordGameViewModelTest(jsonLoader: JSONLoader(), navigator: navigator)
    }
    
    func test_loadWords() {
        XCTAssertFalse(viewModel.correctWords.isEmpty)
    }
    
    func test_points() throws {
        let expectation = expectation(description: "Get async result")
        let truePair = WordPair(text: "test", translation: "test", isCorrectTranslation: true)
        
        viewModel.currentPair.value = truePair
        
        viewModel.guess.send(true)
        viewModel.guess.send(true)
        viewModel.guess.send(true)
        
        viewModel.guess.send(false)
        viewModel.guess.send(false)

        viewModel.points.send(completion: .finished)
        
        viewModel.points.sink { completion in
            expectation.fulfill()
        } receiveValue: { values in
            print(values)
        }.store(in: &cancellables)

        waitForExpectations(timeout: 5)
        XCTAssertEqual(viewModel.points.value.correct, 3)
        XCTAssertEqual(viewModel.points.value.wrong, 2)
    }
    func test_timer() throws {
        let expectation = expectation(description: "Get async result")
        
        viewModel.makeTimer()
        
        DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + 12) {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 12)
        XCTAssertEqual(viewModel.points.value.wrong, 2)
    }
    func test_makePair() throws {
        let truePair = viewModel.makePair(isCorrect: true)
        let falsePair = viewModel.makePair(isCorrect: false)
        XCTAssertTrue(try XCTUnwrap(truePair?.isCorrectTranslation))
        XCTAssertFalse(try XCTUnwrap(falsePair?.isCorrectTranslation))
    }
}
