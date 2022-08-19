//
//  WordPair.swift
//  WordGame
//
//  Created by Erfan Andesta on 5/28/1401 AP.
//

import Foundation

struct WordPair: Decodable, Hashable {
    
    let text: String
    let translation: String
    
    var isCorrectTranslation: Bool = true
    
    enum CodingKeys: String, CodingKey {
        case text = "text_eng"
        case translation = "text_spa"
    }
}
