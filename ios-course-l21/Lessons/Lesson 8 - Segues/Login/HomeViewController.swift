//
//  HomeViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 24.03.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var email: String = ""
    var password: String = ""
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailLabel.text = email
        passwordLabel.text = password
    }
    


}
