//
//  MovieListScreen.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/17.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
    @State private var isAddMoviePresented: Bool = false
    @State private var isAddActorPresented: Bool = false
    @State private var actionName: String = ""
    
    private func saveActor() {
        let actor = Actor(name: actionName)
        context.insert(actor)
    }
    
    var body: some View {
        MovieListView(movies: movies)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Add Actor") {
                        isAddActorPresented = true
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Movie") {
                        isAddMoviePresented = true
                    }
                }
            })
            .sheet(isPresented: $isAddActorPresented, content: {
                Text("Add Actor")
                    .font(.largeTitle)
                
                TextField("Actor name", text: $actionName)
                    .textFieldStyle(.roundedBorder)
                    .presentationDetents([.fraction(0.25)])
                    .padding()
                
                Button("Save") {
                    isAddActorPresented = false
                    saveActor()
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
            .modelContainer(for: [Movie.self, Review.self, Actor.self])
    }
}
