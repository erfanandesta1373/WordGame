//
//  WordGameViewModelTest.swift
//  WordGameTests
//
//  Created by Erfan Andesta on 5/31/1401 AP.
//

import Foundation
@testable import WordGame

class WordGameViewModelTest: WordGameViewModel {
    
    override init(jsonLoader: JSONLoader = .init(), navigator: WordGameNavigator) {
        super.init(jsonLoader: jsonLoader, navigator: navigator)
    }
    override func makeGame() {
        
    }
}
