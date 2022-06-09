//
//  Friend.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 23.05.2022.
//

import Foundation

//// MARK: - FriendsJSON
//struct FriendsJSON: Codable {
//    let response: FriendsResponse
//}
//
//// MARK: - Response
//struct FriendsResponse: Codable {
//    let count: Int
//    let items: [Friend]
//}
//
//// MARK: - Item
//struct Friend: Codable {
//    let id: Int
//    let domain: String
//    let city: City?
//    let trackCode: String
//    let photo100: String
//    let firstName, lastName: String
//    let canAccessClosed, isClosed: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id, domain, city
//        case trackCode = "track_code"
//        case photo100 = "photo_100"
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case canAccessClosed = "can_access_closed"
//        case isClosed = "is_closed"
//    }
//}
//
//// MARK: - City
//struct City: Codable {
//    let id: Int
//    let title: String
//}
