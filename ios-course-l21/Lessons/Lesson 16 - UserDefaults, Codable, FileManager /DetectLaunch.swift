//
//  DetechLaunch.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 25.04.2022.
//

import Foundation

//Класс-сервис - бизнес-логику
struct DetectLaunch {
    
    static let keyFirstLaunch = "isFirstLaunch"
    
    static var isFirst: Bool {
        get {
            return UserDefaults.standard.bool(forKey: keyFirstLaunch)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: keyFirstLaunch)
        }
    }
}
