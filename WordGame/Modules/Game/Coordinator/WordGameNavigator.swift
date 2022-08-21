//
//  WordGameNavigator.swift
//  WordGame
//
//  Created by Erfan Andesta on 5/30/1401 AP.
//

import Foundation
import UIKit

class WordGameNavigator: Navigator {
    
    enum Destination {
        case finalAlert(score: Int, resetHandler: ((UIAlertAction) ->Void)?, exitHandler: ((UIAlertAction) ->Void)?)
    }
    
    //MARK: - Properties -
    let window: UIWindow
    var viewController: UIViewController?
    
    //MARK: - Initializer -
    init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Methods -
    func navigate(to destination: Destination) {
        switch destination {
        case .finalAlert(let score, let handler1, let handler2):
            let tuple1 = (title: "Reset", style: UIAlertAction.Style.default, handler: handler1)
            let tuple2 = (title: "Exit", style: UIAlertAction.Style.destructive, handler: handler2)
            viewController?.showAlert(title: "Results", message: "Final score: \(score)", actions: tuple1, tuple2)
        }
    }
    func start() {
        let viewModel = WordGameViewModel(navigator: self)
        viewController = WordGameViewController(viewModel: viewModel)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
