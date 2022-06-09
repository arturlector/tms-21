//
//  RefValueViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 14.03.2022.
//

import UIKit

class ClassGlobalObject {
    
}

var globalClassObject = ClassGlobalObject()

class RefValueViewController: UIViewController {

    @IBOutlet weak var productLabel: UILabel! //
  
    @IBOutlet var buyItemButton: [UIButton]! //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        revValueObjects()
    }
    
    enum ProductType: Int {
        case corn = 1
        case banana
        case persimmon
    }

    @IBAction func buyAction(_ sender: UIButton) {
        
        switch ProductType(rawValue: sender.tag)  {
            
        case .corn:
            productLabel.text = "Зерно"
            print("Зерно")
        case .banana:
            productLabel.text = "Банан"
            print("Банан")
        case .persimmon:
            productLabel.text = "Хурма"
            print("Хурма")
            
        default: print("Неизвестный объект")
            
        }
    }
}

func refValueType() {
    
    var value: String = "Хурма" //Контейнер для значения

    func someFunc() { //Изолировнный код который имеет название (Контейнер для решения задачи)
        
    }
    
    func unbindCard() { //Отвязать карту
        
    }
    
    //Объект
    
    //value type - тип значение -> статической памяти (Stack)
    
    //копируем значение и создаем новую ячейку памяти
    struct StructObject { //Контейнер для переменных и функций
        
    }
    
    //reference type - ссылочный тип -> динамическая память (Heap)| Оперативная память
    
    //храним ссылку внутри объекта и передаем ссылку на ячейку памяти
    class ClassObject {
        var innerObject: ClassGlobalObject? = nil
    }
    
    let classObject = ClassObject() //ref = 1
    classObject.innerObject = globalClassObject //ref2
    
    //Мы начинаем со структур -> класс
    
    //Reference Type = class
    //class Классовые объекты
    //func
    //closure - функции без названия
    
    //Value Type = struct
    //Примитивные типы - Int, Double, Float
    //Коллекции - Array, Dictionary, Set
    //Struct
    //Enum
    //Tuple
    
}


//Объект-бог синглтон - 
func singleton() {
    
    print(User.shared.bonuses)
    
   
    User.shared.userId = 12321
    User.shared.rank = "5"
    User.shared.bonuses = 1
}

func revValueObjects() {
    
    class Worker {
        var name: String
        var age: Int
        var gender: Bool
        
        init(name: String, age: Int, gender: Bool) {
            self.name = name
            self.age = age
            self.gender = gender
        }
        
        func makeWork() {
            print("Делает работу")
        }
        
        func changeName(name: String) {
            self.name = name
        }
    }
    
    class Supervisor: Worker {
        
        var status: String?
        
        //Переопределение инициализатора
        init(name: String, status: String?) {
            self.status = status
            super.init(name: name, age: 21, gender: true)
        }
        
        override init(name: String, age: Int, gender: Bool) {
            //дополнительная логика
            super.init(name: name, age: age, gender: gender)
        }
    }
    
    //var supervisor = Supervisor(name: "Zack", status: "high")
    //supervisor.changeName(name: "Bro")
    
    
    
    //Инициализатор/конструктор
    var gena = Worker(name: "Gena", age: 25, gender: true)
    
    gena.changeName(name: "Huan")
    
    print(gena.name)
    
    
    struct WorkerStruct {
        var name: String
        var age: Int
        var gender: Bool
        
//        init(name: String, age: Int, gender: Bool) {
//            self.name = name
//            self.age = age
//            self.gender = gender
//        }
        
        func makeWork() {
            print("Делает работу")
        }
        
        mutating func changeName(name: String) {
            self.name = name
        }
    }
    
    var alex = WorkerStruct(name: "Alex", age: 15, gender: false)
    
    alex.changeName(name: "Jack")
    
    print(alex.name)
}


