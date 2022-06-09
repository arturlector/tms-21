//
//  AnimationsViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 07.04.2022.
//

import UIKit

struct Student {
    var name = ""
    var course = ""
}

class AnimationsViewController: UIViewController {

    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    
    @IBOutlet var birdImageView: UIView! //2 картинка
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       startTimer()
        
//        someFunc(value: "12345") {
//            print("Вызов completion")
//        }
        
        someFunc(value: "123456") { student in
            
            print(student)
        }
    }
    
  
    
    func someFunc(value: String, completion: (Student) -> ()) {
        
        //Отправка запроса
        
        //В ответ получили данные
        
        let student = Student(name: "Alex", course: "iOS")
        
        completion(student)
    }
    
    func setupImageView() {
        
        //let imageView = UIImageView(frame: CGRect(x: 100, y: 500, width: 100, height: 200))
        
        
        let imageView = UIImageView()
        let image = UIImage(named: "someImage")
        imageView.image = image
        
        imageView.contentMode = .scaleAspectFill
        
        //Обрезаем по маске - imageView
        //imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 5,
                                         target: self,
                                         selector: #selector(moveImageAction),
                                         userInfo: nil,
                                         repeats: true)
        timer?.fire() //cтартануть
    }
    
    @objc
    func moveImageAction() {
        
        //self.topConstraint.constant = 500
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: [.curveEaseIn]) {
            
            
            self.topConstraint.constant += 50
            self.birdImageView.layoutIfNeeded()
            
            //self.topConstraint.constant = self.topConstraint.constant
        }

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        timer?.invalidate()//отключить
    }
    

   

}
