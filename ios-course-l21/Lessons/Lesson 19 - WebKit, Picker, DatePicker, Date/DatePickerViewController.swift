//
//  DatePickerViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 05.05.2022.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
 
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        //textField.inputView = datePickerView
        
        //datePickerView.datePickerMode = .time
        
        //datePickerView.datePickerStyle = .automatic
    }
    

    @IBAction func chooseDateAction(_ sender: Any) {
        
        let date: Date = datePickerView.date
        
        print(date) //Есть свой формат отображения
        
        //Свой формат отображения
        
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ru_RU")
        
        formatter.dateFormat = "d MMMM, yyyy"
        
        textField.text = formatter.string(from: date).capitalized
        
        //D
        
    }
    
}
