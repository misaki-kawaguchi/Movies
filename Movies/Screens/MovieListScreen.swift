//
//  MovieListScreen.swift
//  Movies
//
//  Created by 川口美咲 on 2024/04/29.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    @Query (sort: \Movie.title, order: .forward) private var movies: [Movie]
    @State private var isAddMoviePresented: Bool = false
    @State private var isActorPresented: Bool = false
    
    var body: some View {
        MovieListView(movies: movies)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Add Actor") {
                    isActorPresented = true
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    isAddMoviePresented = true
                }
            }
        }
        .sheet(isPresented: $isAddMoviePresented, content: {
            NavigationStack {
                AddMovieScreen()
            }
        })
        .sheet(isPresented: $isActorPresented, content: {
            Text("Add Actor")
                .font(.largeTitle)
                .presentationDetents([.fraction(0.25)])
        })
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
            .modelContainer(for: [Movie.self])
    }
}
