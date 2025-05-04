//
//  Movie.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/17.
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var year: Int
    var genre: Genre
    
    var reviewsCount: Int {
        reviews.count
    }
    var actorsCount: Int {
        actors.count
    }

    @Relationship(deleteRule: .cascade, inverse: \Review.movie)
    var reviews: [Review] = []

    @Relationship(deleteRule: .nullify, inverse: \Actor.movies)
    var actors: [Actor] = []

    init(title: String, year: Int, genre: Genre) {
        self.title = title
        self.year = year
        self.genre = genre
    }
}
