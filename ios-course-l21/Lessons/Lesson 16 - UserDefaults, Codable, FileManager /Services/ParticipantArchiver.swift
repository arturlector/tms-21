//
//  ParticipantArchiver.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 12.05.2022.
//

import Foundation

//Класс-сервис - бизнес-логика - архивируем массив участников
protocol ParticipantArchiver {
    func save(_ students: [Participant])
    func retrieve() -> [Participant]
}

final class ParticipantArchiveImpl: ParticipantArchiver {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "participant"
    
    //MARK: - Public methods
    func save(_ students: [Participant]) {
        
        //Array<Student> -> Data
        do {
            let studentData = try encoder.encode(students)
            UserDefaults.standard.set(studentData, forKey: key)
        } catch {
            print(error)
        }
        
    }
    
    func retrieve() -> [Participant] {
        
        //Data -> Array<Student>
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            let studentArray = try decoder.decode(Array<Participant>.self, from: data)
            return studentArray
        } catch {
            print(error)
        }
        return []
    }
}
