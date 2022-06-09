//
//  AutolayoutViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 31.03.2022.
//

import UIKit

class AutolayoutViewController: UIViewController {
    
    @IBOutlet weak var calculatorTextField: UITextField!
 
    @IBOutlet var calculatorButton: [UIButton]!
    
    var result: String = ""
    
    var resultString: String = "2+3*2"
    
    var resultArray: [String] = ["2", "+", "3", "*", "2", "="]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var resultInt = Int(resultString)
        print(resultInt)
        
        let expression = NSExpression(format: resultString)
        print(expression)
        let result = expression.expressionValue(with: nil, context: nil) ?? 0
        print(result)
        
        for button in calculatorButton {
            
            print(button.titleLabel?.text)
            print(button.tag)
        }

    }

    @IBAction func calculateExpressionAction(_ button: UIButton) {
        
        print(button.titleLabel?.text)
        print(button.tag)
        print(result)
        
        if let operand =  button.titleLabel?.text {
            
            if operand == "=" {
                let expression = NSExpression(format: resultString)
                let result = expression.expressionValue(with: nil, context: nil) ?? 0
                print(result)
                
                //let resultDecimal =  result as! Decimal
                calculatorTextField.text = "\(result)"
            }
            
            result = result + operand
        }

    }
    
}
