//
//  ScrollTestViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 21.04.2022.
//

import UIKit

class AlertsViewController: UIViewController {

    @IBOutlet weak var yellowViewRightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var yellowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let attributes = [
//            NSAttributedString.Key.foregroundColor : UIColor.blue,
//            NSAttributedString.Key.backgroundColor : UIColor.clear,
//            NSAttributedString.Key.shadow: shadow,
//            NSAttributedString.Key.font: Fonts.amaticRegular15//UIFont(name: "AmaticSC-Bold", size: 20)
//        ]
        
        //print(type(of: attributes))
        
        
        //Blur на картинку
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.alpha = 0.1
        blurEffectView.frame = yellowView.bounds
        yellowView.addSubview(blurEffectView)
        
        //Контейнер - View
        UIView.animate(withDuration: 1, delay: 0.5) {
            self.yellowViewRightConstraint.constant = 200
            blurEffectView.alpha = 0.7
            self.view.layoutIfNeeded()
            
        }
        
        view.layer.removeAllAnimations()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Alert
//        let alertController = UIAlertController(title: "Батарейка 2%", message: "Срочно поставь на зарядку! \nСрочно поставь на зарядку \nСрочно поставь на зарядку \nСрочно поставь на зарядку", preferredStyle: .actionSheet)
        let alertController = UIAlertController(title: "Батарейка 2%", message: "Срочно поставь на зарядку! \nСрочно поставь на зарядку \nСрочно поставь на зарядку \nСрочно поставь на зарядку", preferredStyle: .alert)
        
        //alertController.view.backgroundColor = UIColor.red
        //alertController.view.layer.masksToBounds = true
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { alertAction in
            if let textField = alertController.textFields?[0] {
                print(textField.text)
            }
            self.yellowView.backgroundColor = .blue
        }
        
        let cancelAction = UIAlertAction(title: "Cancel Срочно поставь на зарядку", style: .default) { alertAction in
            self.yellowView.backgroundColor = .orange
        }
        
        let maybeAction = UIAlertAction(title: "Maybe", style: .default) { alertAction in
            self.yellowView.backgroundColor = .gray
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        alertController.addAction(maybeAction)
        
        alertController.addTextField { textField in
            
          
        }
      
        
        present(alertController, animated: true, completion: nil)
        
        //alertController.dismiss(animated: true, completion: nil)
    }
    


}
