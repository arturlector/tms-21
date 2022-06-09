//
//  Profile.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 23.05.2022.
//

import Foundation


//// MARK: - Profiles
//struct Profiles: Codable {
//    let response: Response
//}
//
//// MARK: - Response
//struct Response: Codable {
//    let items: [Profile]
//}

// MARK: - Item
struct Profile: Codable {
    let id: Int
    let name, username: String
    let email: String?
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

