//
//  WordGameViewController.swift
//  WordGame
//
//  Created by Erfan Andesta on 5/28/1401 AP.
//

import UIKit
import Combine

class WordGameViewController: UIViewController {
    
    //MARK: - IBOutlets -
    @IBOutlet weak var wrongButton: UIButton!
    @IBOutlet weak var correctButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var correctAttemptsLabel: UILabel!
    @IBOutlet weak var wrongAttemptsLabel: UILabel!
    
    //MARK: - IBActions -
    @IBAction func didTapCorrectButton(_ sender: UIButton) {
        viewModel.guess.send(true)
    }
    @IBAction func didTapWrongButton(_ sender: UIButton) {
        viewModel.guess.send(false)
    }
    
    //MARK: - Properties -
    private let viewModel: WordGameViewModel
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Initializers -
    init(viewModel: WordGameViewModel = .init()) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: Self.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Overrides -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.points
            .map { "Correct attempts: \($0.correct)"}
            .receive(on: RunLoop.main)
            .assign(to: \.text, on: correctAttemptsLabel)
            .store(in: &cancellables)
        viewModel.points
            .map { "Wrong attempts: \($0.wrong)"}
            .receive(on: RunLoop.main)
            .assign(to: \.text, on: wrongAttemptsLabel)
            .store(in: &cancellables)
        
        viewModel.currentPair
            .sink { pair in
                self.textLabel.text = pair?.text
                self.translationLabel.text = pair?.translation
            }.store(in: &cancellables)
    }
    
}
