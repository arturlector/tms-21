//
//  XIBViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 28.04.2022.
//

import UIKit

class XIBViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let customButtonView = CustomButtonView()
        view.addSubview(customButtonView)
        
        customButtonView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customButtonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            customButtonView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            customButtonView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            customButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        
    }
    


}
