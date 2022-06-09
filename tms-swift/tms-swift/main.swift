//
//  main.swift
//  tms-swift
//
//  Created by Artur Igberdin on 30.05.2022.
//

import Foundation

//Контейнер для значения
var a: Int = 10

//Неизменяемый контейнер (инициализитовать только 1 раз)
let b: Int
b = 5

//Фундаментальные типы данных
//Int, String, Double, Float, Decimal, Character, Bool
//Range, ClosedRange, PartialRange

var range = 1...10


//Функция - кложур с именем
//Функция - изолированный участок кода, решает задачу, есть имя

func sum<T: Numeric>(a: T, b: T) -> T {
    return a + b
}

let doubleSum = sum(a: 1.5, b: 2.5)


//Функция без имени, вызываем через переменную
var sumClosure: (_ a: Int, _ b: Int)->(Int) = { a, b in
    return a + b
}

var sumValue = sumClosure(a, b)

//Проектируем свои типы данных - объектные типы class/struct

class SomeClass {
    var value = "some value"
    
    //Глобальной память (shared value)
    static var globalValue = "global value"
}

struct SomeStruct {
    var value = "some value"
}

SomeClass.globalValue

//refence type (ссылку на адрес - оригинал)
var someObject1 = SomeClass() //хранятся как ссылка на память в heap (динамическая память)

//value type (копия значения)
var someObject2 = SomeStruct() //хранятся в stack (автоматическая/стэковая память)

//class VC1

//class VC2

//let/var -
//struct/class -

//Network Layer - enum, asyn/await, callback, protocol, extension, urlsession, urlcomponents, codable, generics, result, error handler, status code


//Network Layer - enum protocol extension urlcomponents urlsession codable

//ВВП
enum GDP {
    //ассоциированное значение -
    case russia(Int)
    case belarus(Int, Int)
    case china(Int, Int, Int)
}

enum Barcode {
    case european(Int)
    case russia(Int, Int)
    case usa(Int, String, Int)
}

let russiaGDP = GDP.russia(1_500_000_000_000)

switch russiaGDP {
case .russia(let gdp):
    print(gdp)
case .belarus(let gdp, let people):
    print(gdp)
case .china(let gdp, let people, let army):
    print(gdp)
}

print(russiaGDP, type(of: russiaGDP))


enum Flag: Int {
    //член перечесления = связанное значение
    case white = 0 //1 ячейка
    case red = 1
    case blue = 2
    
    var value: String {
        switch self {
        case .white: return "белый" //данные
        case .red: return "красный"
        case .blue: return "синий"
        }
    }
}

let flag = Flag.white

//switch flag {
//case .white: "белый"
//case .red:
//
//case .blue:
//
//}

print(flag, type(of: flag))

let flagValue = Flag(rawValue: 0)

print(flagValue, type(of: flagValue))

flag.value


//Enum -> Networking Layer
//Enum -> Настройки
//Enum -> Ленты новостей
//Enum -> Сервис ресурсов (шрифты, цвета, картинки)


//Коллекции - Array, Set, Dictionary

//Array - упорядоченный список по индексам одного типа
//- O(1) считывания

//Кладем элемент в конец массива
// O(1) если она помещается в capacity
// O(N) если нужно переместить в другую память,

// O(N) - поиск элемента перебором в массив

//Асимптотика - скорость работы алгоритма/операция в худшем случае

//Set/Dictionary ->

//Dictionary - неупорядоченная коллекци пар значений key:value

//Set - неупорядоченная коллекция уникальных значений

//
let someSet: Set<String> = ["Alex", "Nikita"]
//"Alex" -> хеш-ключ -> число -> индекс внутреннего массива
//БД1 - email
//БД2 - phone
//БД3 - appleID

//Push notification -> Уникальный список пользователей ->

let someDictionary: Dictionary<String, String> = ["red": "красный", "white": "белый"]
//ключ -> "red" -> хеш-код -> числовой индекс массива -> (red, красный)


//Поиск будет O(1)

//High order functions - функции высшего порядка
//transform functions - функциии для преобразования коллекции

let userInput = ["0", "11", "haha", "42"]

var input1 = userInput.map {
    Int($0) //type conversion - конверсию типов через инициализторы
}

var input2 = userInput.compactMap {
    Int($0) //type conversion - конверсию типов через инициализторы
}

print(input1, type(of: input1))
print(input2, type(of: input2))

let products = [1: 5, 10: 2, 2: 10]

let productsSum = products.reduce(0) { result, item  in

    print(result)
    print(item.key, item.value)
    
    return result + item.key * item.value
}
print(productsSum)

let productsSum2 = products.reduce(0) {
    return $0 + ($1.key * $1.value)
}
print(productsSum2)

let prices = [10, 100, 1000]

let pricesSum = prices.reduce(0) {
    print($0) //буферный контейнер
    print($1)
    return $0 + $1
}

let birthday: (String) -> () = {
        print("С днем рождения, \($0)!") //$0 - shorthand syntax
}

birthday("Jack")

print(birthday, type(of: birthday))

func makeRequest(url: String, success: @escaping (String)->(), failure: @escaping (String)->()) {
    
    
//    let task = URLSession.dataTask(url: "error") { data, response, error
//
//    }
    
    //Имитация запроса -> запрос с колбэком
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        
        if url.isEmpty {
            failure("url empty")
        } else {
            success("receive data")
        }
        
    }
}

makeRequest(url: "") { receiveData in
    print(receiveData)
} failure: { error in
    print(error)
}

/*
 
 class VC1 {
    weak var model: Model() //Reference counting = 0
    var VC2: VC2(vc1: self)
 
    func someFunc() {
        VC2.model = model //Ref counting = 2
 
        VC3.model = model //Ref counting = 3 //сколько сильных ссылок у объект
        
       //Закрыли VC3 pop
       //model = 2
 
       //Retain Cycle - цикл сильных ссылок
 
        //ARC - Automatic Reference Counting
    }
    
    
 
 }
 

 
 
 
 */



