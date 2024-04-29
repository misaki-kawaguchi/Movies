//
//  MovieListScreen.swift
//  Movies
//
//  Created by 川口美咲 on 2024/04/29.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    @Query private var movies: [Movie]
    
    var body: some View {
        List(movies) { movie in
            Text(movie.title)
        }
    }
}

#Preview {
    MovieListScreen()
        .modelContainer(for: [Movie.self])
}
