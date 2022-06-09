//
//  DetailViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 17.03.2022.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    
    deinit {
        print("deinit")
    }


}
