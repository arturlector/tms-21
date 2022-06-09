//
//  AppError.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 06.06.2022.
//

import Foundation

enum AppError: Error {
    case mappingError
    case noNetworkError
    case clientError
    case serverError
    
    var description: String {
        switch self {
        case .mappingError:
            return "Ошибка парсинга модели"
        case .noNetworkError:
            return "Отсутсвует интернет"
        case .clientError:
            return "Клиентская ошибка"
        case .serverError:
            return "Серверная ошибка"
        }
    }
}
