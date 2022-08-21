//
//  Navigator.swift
//  WordGame
//
//  Created by Erfan Andesta on 5/30/1401 AP.
//

import Foundation
import UIKit

protocol Navigator {
    
    associatedtype Destination
    
    func navigate(to destination: Destination)
    func start()
}
