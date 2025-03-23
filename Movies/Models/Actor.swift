//
//  Actor.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/23.
//

import Foundation
import SwiftData

@Model
final class Actor {
    var name: String
    var movies: [Movie] = []
    
    init(name: String) {
        self.name = name
    }
}
