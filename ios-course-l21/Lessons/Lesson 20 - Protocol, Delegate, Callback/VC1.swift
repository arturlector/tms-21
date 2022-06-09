//
//  FruitViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 12.05.2022.
//

import UIKit

//VC2 - делегирующий объект
//VC1 - объект делегат

//VC2 - отдает реализацию своих методов своему делегату


class VC1: UIViewController, VC2Delegate {
    
    @IBOutlet weak var fruitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - VC2Delegate
    func didSelectFruit(_ fruit: String) {
        //vc2.
        fruitLabel.text = fruit
    }
    

    //MARK: - Actions
    @IBAction func chooseFruitAction(_ sender: Any) {
        
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc2 = homeStoryboard.instantiateViewController(withIdentifier: "VC2") as! VC2
        
        //VC1 -> VC2 -> delegate(VC1)
        //vc2.delegate = self //VC1()
        
        //Открытая фукнция с колбэком (кложур в параметрах функции)
//        vc2.selectFruit { fruit in
//            fruitLabel.text
//        }
        
        //vc1 -> vc2 -> кложур()
        vc2.onSelectFruitAction = { fruit in
            self.fruitLabel.text = fruit
        }
        
        vc2.someValue = 100
        
        navigationController?.pushViewController(vc2, animated: true)
        
    }
    

}
