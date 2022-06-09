//
//  FriendsAPI.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 26.05.2022.
//

import Foundation

//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

//Service -> business logic -> API for friends
//SRP -> Single Responsibility Principal -> Принцип единой ответственность

//ProfileVC
//ProfileProvider -> Фасад -> управлять сервисами [FriendsAPI, GroupsAPI, APIs]

final class FriendsAPI {

    func fetchFriends(offset: Int = 0, completion: @escaping (Result<[FriendModel], AppError>)->()) {

        var urlComponents = URLComponents() //ascii/percent-encoding
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        
        //URL
        urlComponents.queryItems = [
            URLQueryItem(name: "user_id", value: Session.shared.userId),
            URLQueryItem(name: "order", value: "random"),
            URLQueryItem(name: "count", value: "20"),
            URLQueryItem(name: "fields", value: "online, city, photo_100, country, contacts, bdate"),
            URLQueryItem(name: "offset", value: "\(offset)"),
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents.url else { return }
        
        //URLRequest
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        //Send Request
        let session = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            #warning("Проверка есть ли интернет")
            
            #warning("Обработать 400-е клиентские ошибки")
            #warning("Обработать 500-е сервер лежит")
            
            print(Thread.current)
            print(data?.prettyJSON as Any)
            
            guard let data = data else { return }
            
            do {
                let friendsResponse = try JSONDecoder().decode(FriendsResponse.self, from: data)
                let friends: [FriendModel] = friendsResponse.response.items
                print(friends)
                
                DispatchQueue.main.async {
                    print(Thread.current)
                    completion(.success(friends))
                    //completion(.failure(AppError.noNetworkError))
                }
               
            } catch {
                print(error)
                completion(.failure(AppError.mappingError))
            }
        }
        session.resume()
    }
    
    func fetchFriendsOnline() {
        
        
    }
}
