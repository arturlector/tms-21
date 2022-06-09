//
//  UIViewController+Alerts.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 06.06.2022.
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
