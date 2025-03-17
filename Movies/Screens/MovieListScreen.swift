//
//  MovieListScreen.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/17.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    
    @Query private var movies: [Movie]
    @State private var isAddMoviePresented: Bool = false
    
    var body: some View {
        List(movies) { movie in
            Text(movie.title)
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    isAddMoviePresented = true
                }
            }
        })
        .sheet(isPresented: $isAddMoviePresented, content: {
            NavigationStack {
                AddMovieScreen()
            }
        })
        
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
            .modelContainer(for: [Movie.self])
    }
}
