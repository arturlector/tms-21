//
//  Profile2.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 23.05.2022.
//

import Foundation
import SwiftyJSON

//SwiftyJSON

struct Profile2 {
    
    var id: Int = 0
    var name: String = ""
    var username: String = ""
    var email: String = ""
    
    var fullName: String {
        name + username
    }
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].string ?? ""
        self.username = json["username"].string ?? ""
        self.email = json["email"].string ?? ""
    }
}

