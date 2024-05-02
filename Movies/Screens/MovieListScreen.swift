//
//  MovieListScreen.swift
//  Movies
//
//  Created by 川口美咲 on 2024/04/29.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    @Environment(\.modelContext) private var context
    
    @Query (sort: \Movie.title, order: .forward) private var movies: [Movie]
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    
    @State private var isAddMoviePresented: Bool = false
    @State private var isActorPresented: Bool = false
    @State private var acrorName: String = ""
    
    private func saveActor() {
        let actor = Actor(name: acrorName)
        context.insert(actor)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Movies")
                .font(.largeTitle)
            MovieListView(movies: movies)
            
            Text("Actors")
                .font(.largeTitle)
            
            ActorListView(actors: actors)
        }
        .padding()
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
            TextField("Actor name", text: $acrorName)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Save") {
                isActorPresented = false
                saveActor()
            }
        })
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
            .modelContainer(for: [Movie.self, Review.self, Actor.self])
    }
}
