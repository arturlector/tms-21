//
//  SOLIDViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 21.03.2022.
//

import UIKit

protocol Car {
    var carId: Int { get set }
    func getCarInfo(carId: Int)
}

class SOLIDViewController: UIViewController {

    //MARK: - IBOutlets

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //accesstorsTest()
        
        enumTest()
    }
    
    func enumTest() {
        
        enum Planet:Int, CaseIterable {
            case mercury = 1
            case venus
            case earth
            case mars
            case jupiter
            case saturn
            case uranus
            case neptune
        }
        
        var planet = Planet.mercury
        
        var planet5 = Planet(rawValue: 5)
        
        Planet.allCases.count
        
        for planet in Planet.allCases {
            print(planet)
        }
        
        enum Planet2:String, CaseIterable {
            case mercury
            case venus
            case earth
            case mars
            case jupiter
            case saturn
            case uranus
            case neptune
        }
        
        var planetSaturn = Planet2(rawValue: "saturn")
        
        enum Planet3 {
            //static var allCases: [Planet3]
            
            case mercury(Int)
            case venus(String)
            case earth
            case mars(String, String)
            case jupiter
            case saturn
            case uranus
            case neptune
        }
        
        var mars = Planet3.mars("sputnik1", "sputnik2")
        
        switch mars {
        case let .mars( sp1, _):
            print(sp1)
//        case let .mars( _, sp2):
//            print(sp2)
        default:
            print("unknown planet")
        }
        
        
    }
    
    func accesstorsTest() {
        
        final class CarBuilderImpl: Car {
            
            private init() {}
            static let shared = CarBuilderImpl() //Создается один раз
            
            //MARK: - Public properties
            //Идентификатор автомобиля
            var carId: Int = 12345678
            
            //MARK: - Private properties
            private(set) var brand: String = "Toyota"
            fileprivate(set) var name: String = "Corolla"
            
            private var owner: String = "Jack"
            
            private var mileage: Int = 10000
            
            //+ открыт вне модуля
            var color: String = "red"
            
            //открыт внутри модуля (проетка)
            internal var productionAge: Int = 2010
            
            //MARK: - Public methods
            //Получение полной информации по идентификатору
            func getCarInfo(carId: Int) {
                //Заполняет все остальные поля
            }
        }
        
        var car = CarBuilderImpl.shared //Переиспользуемый объект
        
        car.carId
        car.getCarInfo(carId: car.carId)
        car.brand
        car.name
    }
    
    func SRP() {
        
        //Модель
        //DTO - Data transfer object
        class Person {
            var name: String = "Jack"
            var age: Int = 20
        }
        
        //Класс-сервис по работе с API Person
        class PersonAPI {
            
            func fetchPerson() -> [Person] {
                return [Person()]
            }
        }
        
        //Класс-сервис который может сохранять в БД
        class PersonDB {
            
            func savePerson(_ objects: [Person])  {
                
            }
        }
    }
}
