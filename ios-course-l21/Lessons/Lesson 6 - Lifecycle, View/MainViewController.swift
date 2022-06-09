//
//  MainViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 17.03.2022.
//

import UIKit

//Контейнеры-контроллеры
//Навигация контроллера - переходы между контроллерами

//UINavigationController - стэк - панель сверху
//UITabBarController - панель снижу

class MainViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var innerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Рутовая view
        print(self.view as Any)
        
        //Координатная система относительно себя
        print(self.view.frame)
        
        //Координатная система относительно родительской view
        print(self.view.bounds)

        
        print(containerView.frame)
        print(containerView.bounds)
        
        print("Относительно родитеской", innerView.frame)
        print("Относительно себя", innerView.bounds)
        
        innerView.frame = CGRect(x: 40, y: 20, width: 50, height: 50)
        
        print(innerView.frame)
        
        innerView.layer.cornerRadius = 25
        
        print(innerView.frame.origin)
        
        print("viewDidLoad")
        
        //Создание View кодом
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        
        view.addSubview(redView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        
        UIView.animate(withDuration: 1) {
            self.innerView.frame.origin = CGPoint(x: 50, y: 30)
        }
    }
    
    @IBAction func moveInnerView(_ sender: Any) {
        
        print(innerView.frame.origin.y)
        UIView.animate(withDuration: 1) {
            self.innerView.frame.origin.y += 50
        }
        
        print(innerView.frame.origin.y) //точка
        print(view.frame.height) //высота
        
        if innerView.frame.origin.y > view.frame.height {
            self.innerView.frame.origin.y = -50
        }
        
        print(innerView.frame.origin.y)
    }
    
    deinit {
        print("deinit")
    }
    


}
