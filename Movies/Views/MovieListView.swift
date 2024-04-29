//
//  MovieListView.swift
//  Movies
//
//  Created by 川口美咲 on 2024/04/29.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    let movies: [Movie]
    
    var body: some View {
        List {
            ForEach(movies) { movie in
                HStack {
                    Text(movie.title)
                    Spacer()
                    Text(movie.year.description)
                }
            }
        }
    }
}

#Preview {
    MovieListView(movies: [])
        .modelContainer(for: [Movie.self])
}
