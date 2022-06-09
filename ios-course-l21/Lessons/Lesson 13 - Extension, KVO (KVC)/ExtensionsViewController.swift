//
//  ExtensionsViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 14.04.2022.
//

import UIKit

//KVO - Key Value Observer



class ClassObject {
    var someVariable: Int = 10
    
    var observedVariable: Int = 0 {
        
        //до установки значения
        willSet(newValue) {
            
        }
        
        //после установки значения
        didSet(oldValue) {
            
            //textLabel.text = observedVariable
        }
    }
}

extension ClassObject {
    func sayHello() {
        print("say hello")
    }
    
    class func sayHello() {
        print("say hello")
    }
    
    var someValue: Int {
        return someVariable
    }
}



class ExtensionsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var redView: UIView!
    
    var textVariable: Int = 0 {
        didSet {
            titleLabel.text = "\(textVariable)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        class KVCObject: NSObject {
            
            @objc dynamic var someVariale: Int = 10
        }
        
        let someObject = KVCObject()
        
        someObject.someVariale = 111
        
        //KVC - Key Value Coding
        someObject.setValue(55, forKey: "someVariale")
        
        someObject.value(forKey: "someVariale")
        
        //
        textVariable = 105010
        
        //Основной способ - если мы не делаем свои классы
        //
        let gradient: CAGradientLayer = {
            
            let gradient = CAGradientLayer()
            gradient.type = .axial
            
            gradient.colors = [UIColor.red.cgColor, UIColor.purple.cgColor, UIColor.cyan.cgColor]
            
            gradient.locations = [0, 0.5, 1]
            
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            
            return gradient
        }()
        
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        

        let object = ClassObject()
        object.sayHello()
        
        ClassObject.sayHello()
        
        object.someValue
        
        //Red View
        
        redView.addRadius(10)
        
        redView.addBorder(5, color: .yellow)
        
        redView.addShadow(color: .gray, offset: CGSize(width: 5, height: 5), opacity: 0.5, radius: 20)
        
        view.bringSubviewToFront(redView)
        
        view.bringSubviewToFront(titleLabel)
        
        textVariable = 11111
        
        
        //Radius
        //redView.layer.cornerRadius = 20
        //redView.clipsToBounds = true
        //redView.layer.masksToBounds = true
        
        //Border
//        redView.layer.borderWidth = 3
//        redView.layer.borderColor = UIColor.black.cgColor
        
        //Shadow
//        redView.layer.shadowColor = UIColor.black.cgColor
//        redView.layer.shadowOffset = CGSize(width: 5, height: 5)
//        redView.layer.shadowOpacity = 0.7
//        redView.layer.cornerRadius = 20
        
        //GRADIENT
        
        
        

    }
    

}
