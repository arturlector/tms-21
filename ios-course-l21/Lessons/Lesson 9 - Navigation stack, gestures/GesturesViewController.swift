//
//  GesturesViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 28.03.2022.
//

import UIKit

//@objcMembers
class GesturesViewController: UIViewController {

    
    @IBOutlet weak var yellowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGestures()
    }
    
    func setupGestures() {

        let tapGesture = UITapGestureRecognizer()
        
        tapGesture.addTarget(self, action: #selector(tapGestureAction))
        
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func tapGestureAction() {
        print("Tap Gesture")
    }
    

    @IBAction func showDetailAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailGestureViewController") as! DetailGestureViewController

        detailVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    
    @IBAction func redViewTapAction(_ sender: Any) {
        
        print("redViewTapAction")
    }
    
    
    @IBAction func orangePinchGestureAction(_ sender: Any) {
        
        print("PinchGestureAction")
        
    }
    
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        
        print("pinchAction")
        
        print(sender.scale, sender.velocity)
        
    }
    
}
