//
//  UIView+Styles.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 14.04.2022.
//

import UIKit

extension UIView {
    
    func addRadius(_ value: CGFloat) {
        self.layer.cornerRadius = value
    }
    
    func addBorder(_ value: CGFloat, color: UIColor) {
        self.layer.borderWidth = value
        self.layer.borderColor = color.cgColor
    }
    
    func addShadow(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.cornerRadius = radius
    }
}
