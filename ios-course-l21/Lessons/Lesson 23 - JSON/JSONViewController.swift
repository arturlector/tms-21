//
//  JSONViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 23.05.2022.
//

import UIKit
import SwiftyJSON

//JSONSerialization - ручной парсинг
struct Profile3 {
    var id: Int = 0
    var name: String = ""
    var username: String = ""
    var email: String = ""
    
}

import Foundation

class JSONViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //codableMapping()
        
        //swiftyJSONMapping()
        
        swiftyJSONCodable()
    }
    
    func swiftyJSONCodable() {
        
        guard let jsonData = jsonString2.data(using: .utf8) else { return }
        print(jsonData)
        
        do {
            let itemsData = try JSON(jsonData)["response"]["items"].rawData()

            let profiles = try JSONDecoder().decode([Profile].self, from: itemsData)
            
            print(profiles)
            
        } catch {
            
            print(error)
        }
    }
    
    
    //Codable
    
    func codableMapping() {
        
        guard let jsonData = jsonString.data(using: .utf8) else { return }
        print(jsonData)
        
        do {
            let profiles = try JSONDecoder().decode(Array<Profile>.self, from: jsonData)
            
            print(profiles)
            
        } catch {
            print(error)
        }
    }
    
    //SwiftyJSON
    
    func swiftyJSONMapping() {
        
        guard let jsonData = jsonString.data(using: .utf8) else { return }
        print(jsonData)
        
        guard let items = JSON(jsonData).array else { return }
        
        let profiles = items.map { Profile2(json: $0) }
        
        print(profiles)
    }
    
    //JSONSerialization
    
    

}
