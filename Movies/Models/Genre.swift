//
//  Genre.swift
//  Movies
//
//  Created by 川口美咲 on 2024/05/13.
//

import Foundation

enum Genre: Int, Codable, CaseIterable, Identifiable {
    case action = 1
    case horror
    case kids
    case fiction
    
    var id: Int {
        rawValue
    }
}

extension Genre {
    var title: String {
        switch self {
        case .action:
            return "Action"
        case .horror:
            return "Horror"
        case .kids:
            return "Kids"
        case .fiction:
            return "Fiction"
        }
    }
}
