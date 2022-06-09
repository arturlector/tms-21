//
//  ProtocolsViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 12.05.2022.
//

import UIKit


//1 - Открытый интерфейс работы с объектом (class, struct, enum), Контракт -

//2 - Тип (слабую связность объектов)

//3 - Паттерн Delegate (UIKit паттерн - UIPickerView, WKWebView)

//Интерфейс (в других программирования) - Контракт
protocol SomeProtocol: AnyObject {
    
    //открытая переменная
    //get - считывать извне, set - записывать извне
    //get - getter -> синтезируется метод для переменной чтобы прочитать переменную
    //set - setter -> синтезируется метод для переменной чтобы ее перезаписать
    var someVariable: Int { get set }
    
    var someString: String { get set }
    
    var someBool: Bool { get }
    
    
    //открытый метод
    func someFunc()
}

protocol AnotherProtocol {
    
    var anotherValue: Int { get set }
    
    func anotherFunc()
}

extension AnotherProtocol {
    
    var anotherValue: Int {
        return 2000
    }
    
    func anotherFunc() {
        print("another func")
    }
}

//Множественное наследование протоколов
class SomeClass: SomeProtocol, AnotherProtocol  {
    
    var anotherValue: Int = 123
    
    var someString: String = ""
    
    var innerValue = 10
    
    //закрыта извне
    private (set) var someBool = false
    
    var someVariable: Int {
        get {
            //return innerValue
            return UserDefaults.standard.integer(forKey: "someVariable")
        }
        set(newValue) {
            //innerValue = newValue
            UserDefaults.standard.set(newValue, forKey: "someVariable")
        }
    }
    
    func someFunc() {
        print("Some Func")
        
        someBool = true
    }

}

class SomeClass2: AnotherProtocol {
    var anotherValue: Int = 0
    
}

class ProtocolsViewController: UIViewController {

    //Dependency inversion
    //Инверсию зависимости через протокол (протокол как тип)
    //Неявная зависимость
    
    //Контроллер -> через протокол (неявно) -> сильная связность
    var someObject: SomeProtocol?
    
    //Контроллер -> someObject (явная ссылка) -> слабая связность
    var someObject1 = SomeClass()
    
    /*
    var orderAPI: OrderAPIProtocol?
    
    class OrderAPI {
        //CoreData
    }
    class OrderAPI2 {
        //Realm/SQLite
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controller = ProtocolsViewController()
        
        let someObject = SomeClass() //который подписан/реализовывает
        
        //Просунули объект в переменную
        controller.someObject = someObject

    }

}

//
