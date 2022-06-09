//
//  MarketViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 12.05.2022.
//

import UIKit

protocol VC2Delegate {
    func didSelectFruit(_ fruit: String)
}

class VC2: UIViewController {
    
    //Сюда просовываем контроллер VC1
    var delegate: VC2Delegate?
    
    //Внутренняя переменная - открытая
    var someValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("100 = ",someValue)

    }
    
    //Объявление кложура - контейнер для String
    var onSelectFruitAction: ((String)->())?
    
//    func selectFruit(completion: (String)->()) {
//
//        completion("Фрукт")
//    }
    
    @IBAction func chooseAvocadoAction(_ sender: Any) {
        
        //delegate?.didSelectFruit("АВОКАДО")
        
        //Вызов кложура со значением
        onSelectFruitAction?("Aвокадо")
    }
    
    @IBAction func chooseAppleAction(_ sender: Any) {
        
        //delegate?.didSelectFruit("ЯБЛОКО")
        
        
        onSelectFruitAction?("Яблоко")
    }
    
}
