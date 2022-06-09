//
//  OptionalsViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 11.04.2022.
//

import UIKit

//if let
//guard -> else { return }
//coalescing
//force unwrap
//switch case let (потому что enum)
//optional chaining
//enum.map { unwrap }
//[enum].compactMap { $0 }
//init?()


class OptionalsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let name: String??? = "Antoine van der Lee"
        
        print(type(of: name), name)
        print(name???.count ?? 0)
        
 
        struct Student {
            var name: String?
            
            init?(name: String?) {
                self.name = name
            }
            
            func printName() -> String? {
                return self.name
            }
        }
        
        var student = Student(name: "Jack")
        
        var str: String = "123a"
        
        //str = nil
        
        var intValue = Int(str)
        print(intValue, type(of: intValue))
        
        print(student)
        print(type(of: student))
        
        //Опциональная связка/цепочка
        struct Child {
            var sister: Sister?
        }
        
        struct Sister {
            var brother: Brother?
        }
        
        struct Brother {
            var name = "Bro"
        }
        
        struct Person {
            var child: Child?
        }
        
        let person = Person()
        
        if let brother = person.child?.sister?.brother {
            print(brother.name)
        }
        
        if let child = person.child,
           let sister = child.sister,
           let brother = sister.brother {
            
            print(brother.name)
        }
        
        //map,
        
        let pi: Double? = 3.1411111
        
        pi.map {  print($0.rounded(.up)) }
        
        var piCheck = [pi].compactMap { $0 }
        print(piCheck)
        
        //var piCheck2 = pi.compactMap { $0 }
        //print(piCheck2)
        
        let array: [Int]? = [1, 2, 4, 5]
        
        print(type(of: array))
        print(array)
     
        array.map { print($0) }
        
        let arrayOfOptionalInts: [Int?]? = [1, 2, 4, 5]
        print(arrayOfOptionalInts)
        print(type(of: arrayOfOptionalInts))
        
        var array3 = arrayOfOptionalInts.map { $0 }
        print(array3)
        
        var array2 = arrayOfOptionalInts?.compactMap { $0 }
        print(array2)
    }
    
    func basicUnwrapOperators() {
        
        //Простые операторы раскрытия (unwrap) опционала
        
        var tokenOptional: String? = "12345122344"
        
        var passwordOptional: String? = "qwertyqwert123"
        
        var someVariable: String = ""
        
        //if let
        
        //TODO: -
        if let token = tokenOptional, let password = passwordOptional {
            
            print(token)
            print(type(of: token))
            someVariable = token
        } else {
            print("No value")
        }
        
        print(type(of: tokenOptional))
        
        //TODO: - GUARD
        //guard - раннего выхода (ТОП)
        
        var someIntOptional: Int? = 5
        
        guard let token = tokenOptional,
              let password = passwordOptional,
              let some = someIntOptional,
              some > 0
        else { return }
        
        print(token, tokenOptional, password, some)
        
        //force unwrap - небезопасно
        
        if tokenOptional != nil {
            print(tokenOptional!)
        }
        
        
        //TODO: - ??
        //nil coalescing operato - оператор замены nil
        
        print(tokenOptional ?? "123")
        
        //switch let
        
        switch tokenOptional {
        case let value?: print(value)
            
        case .none:
            print("nothing")
        }
    }
    
    //Как устроен опционал
    func optionalUnderhood() {
        var someInt: Int = 5
        print(type(of: someInt))
        
        var someIntOptional: Int? = 5
        print(type(of: someIntOptional))
        
        
        var someIntOptional2: Optional<Int> = Optional.some(123)
        
        var someIntOptinal3: Int?  = nil
        var someIntOptional4: Optional<Int> = Optional.none
        
        
        @frozen enum MyOptional {
            case some(Int)
            case none
        }
        
        var optinalValue = MyOptional.some(123)
        
        optinalValue = MyOptional.none
        
        switch optinalValue {
        case .some(let value):
            print(value)
        case .none:
            print("Nothing")
        }
    }
    


}
