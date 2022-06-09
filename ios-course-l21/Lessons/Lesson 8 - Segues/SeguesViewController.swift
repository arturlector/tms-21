//
//  SeguesViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 24.03.2022.
//

import UIKit

class SeguesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func modalPresentAction(_ sender: Any) {
        
        //performSegue(withIdentifier: "showPushed", sender: nil)
        
        //Создать второй экран
        //let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        //Разделение на сториборды по модулям
        
        //let storyboard = UIStoryboard.init(name: "Module", bundle: nil)
        //let vc = storyboard.instantiateViewController(withIdentifier: "PushedViewController") as! PushedViewController
        
        let vc = PushedViewController(innerValue: 50, additionValue: "S")
        //vc.innerValue = 100
        
        //Модальное представление
        //self.present(vc, animated: true)
        
        //Пуш в навигационный контроллер (Навигационный переход)
        //push/pop - Stack
        self.navigationController?.pushViewController(vc, animated: true)
        
        //Сделать на него переход
    }
    

    @IBAction func secondPresentAction(_ sender: Any) {
        //Запускает сегвей
        performSegue(withIdentifier: "showModalViewController", sender: nil)
    }
    
    //Перехватывает сегвей
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showModalViewController" {
            
            let vc = segue.destination as! ModalViewController
            vc.modalValue = "Jack"
            print(vc.modalValue)
            
        }
    }
    
    
}
