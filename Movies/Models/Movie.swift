//
//  Movie.swift
//  Movies
//
//  Created by 川口美咲 on 2024/04/29.
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var year: Int
    
    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}
