//
//  Friend.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 26.05.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let friendsResponse = try? newJSONDecoder().decode(FriendsResponse.self, from: jsonData)

import Foundation

// MARK: - FriendsResponse
struct FriendsResponse: Codable {
    let response: FriendsItems
}

// MARK: - Response
struct FriendsItems: Codable {
    let count: Int
    let items: [FriendModel]
}

// MARK: - Item
struct FriendModel: Codable {
    let id: Int
    let isClosed: Bool?
    let trackCode: String
    let canAccessClosed: Bool?
    let mobilePhone, bdate: String?
    //let city: City?
    let firstName: String
    //let homePhone: HomePhone?
    let photo100: String
    //let country: City?
    let online: Int
    let lastName: String
    let deactivated: String?

    enum CodingKeys: String, CodingKey {
        case id
        case isClosed = "is_closed"
        case trackCode = "track_code"
        case canAccessClosed = "can_access_closed"
        case mobilePhone = "mobile_phone"
        case bdate
        //, city
        case firstName = "first_name"
        //case homePhone = "home_phone"
        case photo100 = "photo_100"
        //case country,
        case online
        case lastName = "last_name"
        case deactivated
    }
}

//// MARK: - City
//struct City: Codable {
//    let id: Int
//    //let title: Title
//}

//enum Title: String, Codable {
//    case казань = "Казань"
//    case калининград = "Калининград"
//    case москва = "Москва"
//    case россия = "Россия"
//}

//enum HomePhone: String, Codable {
//    case empty = ""
//    case homePhone = "-"
//    case the8432672229 = "(843)267-22-29"
//}

