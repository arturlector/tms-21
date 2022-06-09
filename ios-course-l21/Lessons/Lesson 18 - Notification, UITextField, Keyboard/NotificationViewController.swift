//
//  NotificationViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 02.05.2022.
//

import UIKit

//Применение
//Используется там где мы не можем передать данные
//NavigationBar/TabBar (подписаны на событие - новые сообщение) -> прилетают данные (5 новых сообщений) -> пульнуть всем подпискам

//NotificationCenter -> Observer -> Радиоприемник/Пейджер -> Отправитель/Получатель (подписываемся на событие)
//Local Notification (не используется)
//Push Notification

//Системные события - Клавиатура открылась/закрылась, Батарейка заряжена/разряжена

//Отдельный файл - где все события которые заложены кастомно
extension Notification.Name {

    //Глобальная память, константа - переиспользуется
    static let didColorChangeNotification = Notification.Name("didColorChangeNotification")
    
    //showLockerScreenNotification
    //
    
    //10-15 наших событий
}

class NotificationViewController: UIViewController {

//    let didColorChangeNotification = Notification.Name("didColorChangeNotification")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Переиспользуется (Shared object)
        NotificationCenter.default.addObserver(self, selector: #selector(changeColorNotification(_:)), name: Notification.Name.didColorChangeNotification, object: nil)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .didColorChangeNotification, object: nil)
    }
    
    @objc
    func changeColorNotification(_ notification: Notification) {
        
        //as? type casting - привидение типа
        if let color = notification.userInfo?["color"] as? UIColor {
            view.backgroundColor = color
        }
    }

    //Источник
    @IBAction func changeColorAction(_ sender: Any) {
        //Событие без данных
        //NotificationCenter.default.post(name: .didColorChangeNotification, object: nil)
        
        //Событие с данными
        NotificationCenter.default.post(name: .didColorChangeNotification, object: nil, userInfo: ["color": UIColor.orange]) //[AnyHashable:Any]
    }
    
}
