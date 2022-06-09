//
//  ClassArchiveViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 28.04.2022.
//

import UIKit

class Record: Codable, CustomStringConvertible {
    let date: String
    let value: Int
    init(myDate: String, myValue: Int){
        date = myDate
        value = myValue
    }
    
    var description: String {
        return "\(date) \(value)"
    }
}

class RecordArchiver {
   
    let userDefaults = UserDefaults.standard
    
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    let key = "records"
    

    func save(records:[Record]){
        
        do{
            let data = try encoder.encode(records)
            userDefaults.set(data, forKey: key)
            print(data)
        } catch {
                print(error)
            }
    }
    
    func retrieveRecords() -> [Record] {
        
        guard let data = userDefaults.data(forKey: key) else {
            return []
        }
        
        do {
          let  test = try decoder.decode(Array<Record>.self, from: data)
            print(test[0], "tata")
            
            test.map { print($0.date, $0.value)}
            
            return test
        } catch {print(error)}
        return []
    }
}
        
        

class ClassArchiveViewController: UIViewController {

    let recordArchiver = RecordArchiver()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myRecord = Record(myDate: "111", myValue: 222)
        
        recordArchiver.save(records: [myRecord, myRecord])
        
        let result = recordArchiver.retrieveRecords()
        
        let element: Record = result[0]
        
        print(result[0].description, "vovo")
    }
    

  
}
