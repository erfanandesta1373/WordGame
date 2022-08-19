//
//  JSONLoader.swift
//  WordGame
//
//  Created by Erfan Andesta on 5/28/1401 AP.
//

import Foundation


class JSONLoader {
    
    func load(file: String, for aClass: AnyClass) -> Data? {
        let bundle = Bundle(for: aClass)
        guard let url = bundle.url(forResource: file, withExtension: "json") else {
            return nil
        }
        return try? Data(contentsOf: url)
    }
    func load<T: Decodable>(file: String, for aClass: AnyClass, model: T.Type) -> T? {
        guard let data = load(file: file, for: aClass) else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
