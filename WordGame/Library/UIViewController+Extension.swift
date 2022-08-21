//
//  UIViewController+Extension.swift
//  WordGame
//
//  Created by Erfan Andesta on 5/30/1401 AP.
//

import UIKit


extension UIViewController {
    func showAlert(title: String, message: String, actions: (title: String, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?)...) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alert.addAction(UIAlertAction(title: action.title, style: action.style, handler: action.handler))
        }
        present(alert, animated: true)
    }
}
