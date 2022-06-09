//
//  DetailViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 28.03.2022.
//

import UIKit

class DetailGestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        

    }
    
    @IBAction func backAction(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    

}
