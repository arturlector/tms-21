//
//  LoginViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 24.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signInAction(_ sender: Any) {
        
        performSegue(withIdentifier: "showHomeViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showHomeViewController" {
            
            let homeVC = segue.destination as! HomeViewController
            
            if let email = emailTextField.text, let password = passwordTextField.text {
                
                //не загружен view в HomeViewController (viewDidLoad)
                
                homeVC.email = email
                homeVC.password = password
            }
        }
    }
    
 

}
