//
//  KeyboardViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 02.05.2022.
//

import UIKit

//Клавиатура/Текст - цифры


//Cmd + Shit + K - открытие/закрытие клавиатуры в симуляторе

class KeyboardViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var telephoneTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Контроллер -> TextField -> Контроллер
        emailTextField.delegate = self
        passwordTextField.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            telephoneTextField.becomeFirstResponder()
        case telephoneTextField:
            emailTextField.becomeFirstResponder()
        default:
            print("Unknown textfield")
        }
        return true
 
    }
    
    @objc
    func keyboardShow(notification: Notification) {
        print("keyboardShow")
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        
        print(info)
        
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc
    func keyboardHide(notification: Notification) {
        print("keyboardHide")
        
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    


}
