//
//  ViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 24.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Lyfecycle
    
    //Тип значения - Стэковая память
    let size: Double = 1.000000001 //64бит
    let width: Double = 0.999999999 //32бит
    let height: Float = 1.5
    
    let a: Double = 1.000001
    let b: Double = 0.000001
    
    var account: Decimal = 10000.50 //64бит x 2 x 4
    
    var technologyScreen: String = "OLED" //список - "O", "L", "Е", "D"
    var technologyScreen2: String = "RETINA"
    
    var applicationIsLaunched = true //флаг
    
    var symbol: String = "A"
    
    let osVersion: Int = 15
    
    class MyClass {
        var steps = 5
        static var count = 9
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let age = -3
        //assert(age >= 0, "A person's age can't be less than zero.")
        

        let a1: Double = 1.00000000000001 //64бит
        let b1: Double = 0.00000000000003
        let c1 : Double = a - b
        print(c1)
        
        
//        var resultSymbol = Int(symbol)
//        print(resultSymbol)
        
        var resultSize = size - width
        print(resultSize)
        
        var c = a - b
        print(c)
        
        let aspectRatio = height / Float(width)
        print(aspectRatio)
        
        print(UInt8.max)
        
//        let heightForce = height as Double
//
//        let aspectRatio2 = heightForce / width
//        print(aspectRatio2)
        /*
         
         */
        
        //size = 7.1
        
        if technologyScreen == technologyScreen2 {
            print("Same technology")
        } else {
            print("Different")
        }
        
        var iPhoneModelStorage = "iPhoneXR"
        
        switch iPhoneModelStorage {
            
        case "iPhone13":
            print("128GB")
        case "iPhoneXR":
            print("64GB")
            
        default:
            print("32GB")
        }
        
        enum CarBrands {
            case Mazda
            case BMW
            case Audi
            case Toyota
        }
        
        let myCar: CarBrands = .Toyota
        
        switch myCar {
        case .Mazda:
            print("Mazda")
            
        case .BMW:
            print("BMW")
            
        case .Audi:
            print("Audi")
        case .Toyota:
            print("Toyota")
        }
        
        
        
        
        //Ccылочный тип - ОЗУ
        let myClass = MyClass()
        myClass.steps = 7
        
        //Глобальная память -
        MyClass.count = 10
        
        
        //Хранение в папке проекта:
        //База данных = файл в папке
        
        //Хранение данных на серверах
        //API - Базы данных
        //Firebase
        
        //Хранение на уровне ОС
        //Keychain
        
    }
    
    
}

