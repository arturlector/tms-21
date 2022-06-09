//
//  Session.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 26.05.2022.
//

import Foundation

//Service -> business logic -> manage token
final class Session {
    
    private init() {}
    
    static let shared = Session() //Global memory + contant -> shared object
    
    var token: String = ""
    var userId: String = ""
    var expiresIn: String = ""
    
    #warning("Отслеживал время токена")
    
    #warning("Сохранение токена в Keychain а остальное в UserDefaults")
}
