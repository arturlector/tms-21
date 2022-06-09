//
//  PushedViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 24.03.2022.
//

import UIKit

class PushedViewController: UIViewController {

    var innerValue: Int
    var additionValue: String
    
    init(innerValue: Int, additionValue: String) {
        self.innerValue = innerValue
        self.additionValue = additionValue
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(innerValue, additionValue)
        
        view.backgroundColor = .darkGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print(innerValue)
    }
    
    deinit {
        
    }

}
