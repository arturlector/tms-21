//
//  PickerViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 05.05.2022.
//

import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var itemTextField: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var cities = [["Amsterdam", "Berlin", "Kopengagen", "Rome", "Paris"], ["100", "200", "300", "400", "500"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Контроллер держи Пикер держит контроллер (двусторонняя связь)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        itemTextField.inputView = pickerView
        
        //pickerView.isHidden = true
        
        //Событие нажатия на текст -> появляться пикер
        //Пикер остановили -> исчезает
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.first?.count ?? 0
    }
    
    //Row - ряд, Component - столбец
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let first = cities.first?[row]
        
        let last = cities.last?[row]
        
        itemTextField.text = "\(first ?? "") \(last ?? "")"
    }

}
