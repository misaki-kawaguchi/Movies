//
//  ActorDetailScreen.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/23.
//

import SwiftUI

struct ActorDetailScreen: View {
    
    let actor: Actor
    @State private var selectedMovies: Set<Movie> = []
    
    var body: some View {
        VStack {
            MovieSelectionView(selectedMovies: $selectedMovies)
                .onAppear {
                    selectedMovies = Set(actor.movies)
                }
            
        }
        .navigationTitle(actor.name)
    }
}

//#Preview {
//    ActorDetailScreen()
//}
