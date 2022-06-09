//
//  FunctionsViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 03.03.2022.
//

import UIKit

/*
 Какие памяти есть в iOS:
 
 - Статическая память (Глобальная память)
 - Автоматическая память (Стековая память)
 - Динамическая память (Куча/Heap - Оперативная память)
 */

//static let cardIdGlobal = "121234123123131231312"

//Глобальная по отношению ко всему приложению
func appendCard() {
    
}

var cardNumberGlobal: Int = 789789789

func getCustomFont(name: String) -> UIFont? {
    
    return UIFont(name: "", size: 10)
}

//Объектные типы

//ссылка на адресное пространстов (Heap, Куча, ОЗУ) - долговременная память
class MyClass {
    //Переменные
    var cardNumber: Int = 123412341234
    
    //Глобальная статическая память - будет жить все приложение
    static var cardId: String? = "121234123123131231312"
    
    static var cardId2: String = "121234123123131231312"
    
    //Функции
    func showCardNumber() {
        print(cardNumber)
        
        appendCard()
    }
}

//хранятся в стэковая память - коротковременная память
struct MyStruct {
    //Внутренние переменные объекта
    var cardNumber: Int = 123412341234
    
    //Глобальная статическая память - будет жить все приложение
    static let cardId = "121234123123131231312"
    
    //Функции
    func showCardNumber() {
        print(cardNumber)
        
        appendCard()
    }
    
    func displayCard(completion: ()->()) {
        
        displayCard {
            print("Функционал")
            
            debugPrint("Функционал")
        }
    }
    
    static func showCardNumber1() {
        
        appendCard()
        
        var myStruct = MyStruct()
        myStruct.cardNumber //Объект создан и у него есть ссылка на адрес/часть памяти
        
        MyStruct.cardId //Объект не создается
        
        MyStruct.showCardNumber1()
    }
    
}



class FunctionsViewController: UIViewController {

    var cardNumber: Int = 123412341234
    
    static var cardId = "121234123123131231312"
    
    //Функция - контроллер загружен в память
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func unbindCard() {
            
        }
        unbindCard()
        
        var email = "test@test.ru"
        var password = "qwerty12345"
        
        let userId = signIn(email: &email, password: &password)
        
        print(email)
        print(password)
        
        //signIn(password: "asdfg12345")
        //signIn(email: "test@test.ru")
        
        print(userId)
        
        cardNumber
        
        appendCard()
        
        //СТАТИЧЕСКИЕ ПЕРЕМЕННЫЕ
        
        print(MyClass.cardId)
        print(MyClass.cardId2)
        
        print(MyStruct.cardId)
        
        print(FunctionsViewController.cardId)
    }
    
    //Изолированный участок кода - ccылка на адресное пространо в памяти - имя есть у функции
    func addCard(number: Int = 1231231234) {
        
        func deleteCard() {
            
        }
        
        addCard()
        
        //addCard(number: "234234234")
        
        print(number)
        
    }
    
    func removeCard() {
        
    }
    
    //Войти
    func signIn(email: inout String, password: inout String) -> Int {
        
        let userId = 1222332111
        
        email = "new@new.ru"
        password = "newnewnew"
        
        
        cardNumber
        
        return userId
    }
    
    //Выйти
    func signOut() {
        
        //Локальная переменная - внутренняя для функции
        var cardNumber = 456745674567
        
        //Глобальная переменная - внутрняя для контроллера/объект
        self.cardNumber
        
        cardNumberGlobal
        
    }
    
    //Зарегаться
    func signUp() {
        
        signUp()
    }

 

}
