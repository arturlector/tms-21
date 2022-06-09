//
//  MainTabBarVC.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 02.06.2022.
//

import UIKit

class MainTabBarVC: UITabBarController {

    enum TabBarType {
        case friends
        case photos
        case groups
        
        var image: UIImage? {
            switch self {
            case .friends:
                return UIImage(systemName: "person.2")
            case .photos:
                return UIImage(systemName: "photo.on.rectangle.angled")
            case .groups:
                return UIImage(systemName: "newspaper")
            }
        }
        
        var title: String {
            switch self {
            case .friends:
                return "Друзья"
            case .photos:
                return "Фото"
            case .groups:
                return "Группы"
            }
        }
    }
    
    let friendsVC = FriendsVC()
    let photosVC = PhotosVC()
    let groupsVC = GroupsVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarItems()
        
//        let friendsTabBarItem = UITabBarItem()
//        friendsTabBarItem.image = UIImage(systemName: "person.2")
//        friendsTabBarItem.title = "Друзья"
//        friendsVC.tabBarItem = friendsTabBarItem
//
//        let photosTabBarItem = UITabBarItem()
//        photosTabBarItem.image = UIImage(systemName: "photo.on.rectangle.angled")
//        photosTabBarItem.title = "Фото"
//        photosVC.tabBarItem = photosTabBarItem
//
//        let groupsTabBarItem = UITabBarItem()
//        groupsTabBarItem.image = UIImage(systemName: "newspaper")
//        groupsTabBarItem.title = "Группы"
//        groupsVC.tabBarItem = groupsTabBarItem
//
//        let controllers = [friendsVC, photosVC, groupsVC]
//        self.viewControllers = controllers
        
    }
    
    private func setupTabBarItems() {
        
        let items: [TabBarType] = [.friends, .photos, .groups]
        
        self.viewControllers = items.map {
            switch $0 {
            case .friends:
                friendsVC.tabBarItem.image = $0.image
                friendsVC.tabBarItem.title = $0.title
                return friendsVC
                
            case .photos:
                photosVC.tabBarItem.image = $0.image
                photosVC.tabBarItem.title = $0.title
                return photosVC
                
            case .groups:
                groupsVC.tabBarItem.image = $0.image
                groupsVC.tabBarItem.title = $0.title
                return groupsVC
            }
        }
    }
}
