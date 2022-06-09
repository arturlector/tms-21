//
//  AttributedStringsViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 18.04.2022.
//

import UIKit

class AttributedStringsViewController: UIViewController {

    @IBOutlet weak var attributedLabel: UILabel!
    @IBOutlet weak var attributedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family: String in UIFont.familyNames
        {
            print(family)
            //O(n)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
        //Attributed String
        
        //O(1)
        let someString = "Swift Attributed String"
        //Хеш - число
        //Хеш-функция
        
        //Shadow
        
        func someFunc(attributes: [NSAttributedString.Key : Optional<NSObject>]) {
            
            var attributesInner: [NSAttributedString.Key : Optional<NSObject>] = [
                NSAttributedString.Key.foregroundColor : UIColor.blue,
                NSAttributedString.Key.backgroundColor : UIColor.clear,
                NSAttributedString.Key.shadow: shadow,
                NSAttributedString.Key.font: Fonts.amaticRegular15//UIFont(name: "AmaticSC-Bold", size: 20)
            ]
            
            //
            attributesInner = attributes
            
            
        }
        
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 1, height: 1)
        shadow.shadowColor = UIColor.gray.withAlphaComponent(1)
        shadow.shadowBlurRadius = 30
        
        let attributes: [NSAttributedString.Key : Optional<NSObject>] = [
            NSAttributedString.Key.foregroundColor : UIColor.blue,
            NSAttributedString.Key.backgroundColor : UIColor.clear,
            NSAttributedString.Key.shadow: shadow,
            NSAttributedString.Key.font: Fonts.amaticRegular15//UIFont(name: "AmaticSC-Bold", size: 20)
        ]
        
        print(type(of: attributes))
        
        let attributedString: NSAttributedString = NSAttributedString(string: someString, attributes: attributes)
        
        attributedLabel.attributedText = attributedString
        
        let buttonAttributes = [
            //NSAttributedString.Key.foregroundColor : UIColor.blue,
            //NSAttributedString.Key.backgroundColor : UIColor.clear,
            NSAttributedString.Key.shadow: shadow,
            //NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
        ]
        
        let attributes2 = [
            NSAttributedString.Key.foregroundColor : UIColor.blue,
            NSAttributedString.Key.backgroundColor : UIColor.clear,
            NSAttributedString.Key.shadow: shadow,
            NSAttributedString.Key.font: Fonts.amaticBold20//UIFont(name: "AmaticSC-Bold", size: 30)
        ]
        let attributedString2 = NSAttributedString(string: someString, attributes: attributes2)
        
        attributedButton.setAttributedTitle(attributedString2, for: .normal)
        
        
        //AmaticSC-Bold
        
       
        
        
        
        
    }
    
    


}
