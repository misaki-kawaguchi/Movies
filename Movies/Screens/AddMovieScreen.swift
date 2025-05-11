//
//  AddMovieScreen.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/17.
//

import SwiftUI
import SwiftData

struct AddMovieScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var title: String = ""
    @State private var year: Int?
    @State private var selectedActors: Set<Actor> = []
    @State private var genre: Genre = .action
    
    private var isFormValid: Bool {
        !title.isEmpryOrWhiteSpace && year != nil && !selectedActors.isEmpty
    }
    
    var body: some View {
        Form {
            
            Picker("Select Genre", selection: $genre) {
                ForEach(Genre.allCases) { genre in
                    Text(genre.title).tag(genre)
                }
            }
            .pickerStyle(.segmented)
            
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            
            Section("Select Actors") {
                ActorSelectionView(selectedActors: $selectedActors)
            }
        }
        .onChange(of: selectedActors, {
            print(selectedActors.count)
        })
        .navigationTitle("Add Movie")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    guard let year = year else { return }
                    
                    let movie = Movie(title: title, year: year, genre: genre)
                    movie.actors = Array(selectedActors)
                    
                    selectedActors.forEach { actor in
                        actor.movies.append(movie)
                        context.insert(actor)
                    }
                    
                    context.insert(movie)
                    
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    dismiss()
                }
                .disabled(!isFormValid)
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddMovieScreen()
            .modelContainer(for: [Movie.self, Review.self, Actor.self])
    }
}
