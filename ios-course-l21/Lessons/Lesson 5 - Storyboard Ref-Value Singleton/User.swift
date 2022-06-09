//
//  User.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 14.03.2022.
//

import Foundation

//СИНГЛТОН - 1-й паттерн проектирования (эффективной шаблон решения типовой задачи)

//final - не можем наследоваться

//Класс-сервис - класс который выполняет бизнес-логику - хранения настроек пользователя
final class User {
    
    private init() {} //закрыли инициализатор
    
    var userId: Int = 0
    var rank: String = "1"
    var bonuses: Int = 0
    
    //Глобальная память
    //создали объекв в переменной константе в глобальной памяти
    //Суть паттерна синглтон
    static let shared = User()
}

/*
 
 Глобальный объект который переиспользуется
 
 User/Profile
 BluetoothService
 LocalStorage
 
 SuperService
 
 
 */


