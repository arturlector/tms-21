//
//  LocalStorageViewController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 25.04.2022.
//

import UIKit
import SwiftKeychainWrapper

class LocalStorageViewController: UIViewController {
    
    let participantArchiver: ParticipantArchiver = ParticipantArchiveImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //useUserDefaults()
        //
        //        if DetectLaunch.isFirst == false {
        //
        //            print("Запускаем туториал или онбоaрдинг")
        //
        //            //Первый запуск был
        //            DetectLaunch.isFirst = true
        //        }
        
        //useKeyChain()
        //useCodableArchiving()
        
        useFileManager()
    }
    
    func useUserDefaults() {
        
        //UserDefaults
        //Самое простое хранилище key/value
        //В папке приложения, в plist
        //Потеряем при удалении приложение
        //Не защищенное - не храним user-sensitive data
        //Для хранения примитивных типы - Int, Double, String, Data (бинарное представление)
        
        //Сохранили
        UserDefaults.standard.set("admin", forKey: "user")
        
        //Считывать
        let userName = UserDefaults.standard.string(forKey: "user")
        
        print(userName)
        
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(1000, forKey: "wallet")
        
        userDefaults.integer(forKey: "wallet")
        
        //userDefaults.removeObject(forKey: )
        
        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            print("\(key) = \(value) \n")
        }
        
    }
    
    func useKeyChain() {
        
        //KeyChain
        //Хранение в ОС, при удалении приложения останется
        //Защищенное
        //Для хранения примитивных типы - Int, Double, String
        
        KeychainWrapper.standard.set("test12345", forKey: "password")
        KeychainWrapper.standard.set("test@test.ru", forKey: "email")
        
        let password = KeychainWrapper.standard.string(forKey: "password")
        print(password)
        
        print(KeychainWrapper.standard.allKeys())
        
    }
    
    func useCodableArchiving() {
        
        //Decoder = Data -> Model (свифтовая модель)
        
        //Encoder = Model -> Data (двоичное представление)
        
        struct Student: Decodable, Encodable {
            let name: String
            let codeRank: Int
        }
        
        let students: [Student] = [Student(name: "Alex", codeRank: 40), Student(name: "Alexandr", codeRank: 40)]
        
        //Array<Student> -> Data
        do {
            let studentData = try JSONEncoder().encode(students)
            print(studentData)
            
            UserDefaults.standard.set(studentData, forKey: "students")
            
        } catch {
            print(error)
        }
        
        //Data -> Array<Student>
        
        guard let data = UserDefaults.standard.data(forKey: "students") else { return }
        
        do {
            
            let studentArray = try JSONDecoder().decode(Array<Student>.self, from: data)
            print(studentArray)
            
            studentArray.map { print($0.name, $0.codeRank) }
            
        } catch {
            print(error)
        }
    }
    
    
    func useFileManager() {
        
        let documentsDirectory = NSHomeDirectory()
        
        let temporaryDirectory = NSTemporaryDirectory()
        
        print(documentsDirectory)
        print(temporaryDirectory)
        
        
        let testFilePath = FileManager.default.temporaryDirectory.appendingPathComponent("testfile.txt").path
        
        print(testFilePath)
        
        // String(utf8) -> Data
        //let data = "Clan Swift Marathon".data(using: .utf8)
        
        participantArchiver.save([Participant(clan: "SwiftMarathon", codeRank: 100)])
        
        guard let data = UserDefaults.standard.data(forKey: "participant") else { return }
        
        //print(participantArchiver.retrieve())
        
        //CREATE
        FileManager.default.createFile(atPath: testFilePath, contents: data, attributes: nil)
        
        do {
            //READ
            let text = try String(contentsOfFile: testFilePath)
            print(text)
        } catch {
            print(error)
        }
        
       
        
        do {
            //DELETE
            try FileManager.default.removeItem(atPath: testFilePath)
        } catch {
            print(error)
        }
       
    }
    
}

struct Participant: Decodable, Encodable {
    let clan: String
    let codeRank: Int
}




