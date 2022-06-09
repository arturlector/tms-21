//
//  ArraysViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 10.03.2022.
//

import UIKit

var globalVarForApp = 2

class ArraysViewController: UIViewController {
    
    var globaVarForController = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var innerVarForFunc = 3
        
        themeAboutArrays()
    }
    
    func themeAboutArrays() {
        
        var array1: [String] = ["1", "2", "3"] //+
        
        var array2: Array<String> = ["1", "2", "3"]
        
        var array3: [Int] = []//+
        
        var array4 = [Int]()
        
        struct DTO {}
        
        var array5: [Any] = ["1", true, 123, DTO()] //Any - для примитивных типов
        
        class Model {}
        
        var array6: [AnyObject] = [Model(), Model()]
        
        var array7: [[Int]] = [[1, 2], [4, 5]]
        
        print(array7[0][1])
        
        var array8: [Int]? = [1, 2, 3] //
        //print(array8?[3])
        
        array8?.first
        
        array8?.last
        
        array8?.isEmpty
        
        array8 = nil
        
        print(array8?.isEmpty)
        
        //
        
        var names: [Any?] = ["John", "Emma", nil, "Robert", "Julia"]
        
        for name in names {
            print(name)
        }
        
        names.forEach { name in
            print(name)
        }
        
        //map
        
        var buffer = [Int]()
        buffer.reserveCapacity(100) //2x64
        buffer.append(5)
        buffer.append(5)
        
        //Сокращенный синтаксис при работе с high order functions
//        map
//        compactMap
//        flatMap
//        forEach
        
        names = [nil, nil, Optional.some(Optional.some("456")), nil, "123", MyError()]
        
        var names1 = names
            .map { $0 }
            //.compactMap { Int($0) }
            //.contains(where: { $0 == "123" } )
        
        print(names1)
        
        var names2 = names.map { $0 }
        print("map =", names2)
        
        var names3 = names.compactMap { $0 }
        print("compactMap = ", names3)
        
//        enum ErrorType: Error {
//            case commonError
//        }
        
        struct MyError: Error {
            
        }
        
        var names4 = names.flatMap { $0 }
        print("flatMap = ", names4)
        
        var names5 = [[1, 2], [3], [[5]]].flatMap { $0 }
        print(names5)
        
        
        /*
         filter
         contains
         allSatisfy
         */
        var odds = [1, 2, 3, 4, 5].filter { $0 % 2 == 0 }
        print(odds)
        
        //Удовлетворяет все элементы
        var isSatified = [1, 2, 3, 4, 5].allSatisfy { $0 > 0 }
        print(isSatified)
        
        var isContains = [1, 2, 3, 4, 5].contains { $0 > 5 }
        print(isContains)
        
        var odds1 = [1, 2, 3, 4, 5].filter { $0 % 2 == 0 }
        print(odds1)
        
        
        let helloSwift = "token#123455322134322"
        
        let result = helloSwift.split(separator: "#")
        print(result)
        
        //reduce
    }
    
    
    func themeAboutFunctions() {
        
        simpleFunction()
        
        functionWithClosure {
            
        } failure: {
            
        }
        
        // First-class function/types
        func sayHello() {
            print("Hello")
        }
        
        //Функция можно положить в переменную
        let helloVar: () -> () = sayHello
        
        //Функцию можно передать в параметр функции
        func greeting(function: () -> ()) {
            
            //вызвать функцию
            function()
        }
        
        greeting(function: helloVar)
        
        //Variadic parameters
        
        func sayHello(text: String, names: String...) {
            
            for name in names {
                print(name)
            }
        }
        
        sayHello(text: "Hello", names: "Alex", "John", "Ted")
        
    }
    
    func simpleFunction() {
        
    }
    
    func functionWithReturnValue(value: String) -> String {
        return "\(value)"
    }
    
    func functionWithReturnTuple() -> (Int, String, Int) {
        
        func codeToText(code: Int) -> String {
            return "У пользователя просрочен паспорт"
        }
        
        return (200, "OK", 1020)
    }
    
    func functionWithClosure(success: ()->(), failure: ()->()) {
        
    }
}
