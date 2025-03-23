//
//  ActorListView.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/23.
//

import SwiftUI

struct ActorListView: View {
    
    let actors: [Actor]
    
    var body: some View {
        List(actors) { actor in
            NavigationLink(value: actor) {
                ActorCellView(actor: actor)
            }
        }
        .navigationDestination(for: Actor.self) { actor in
            ActorDetailScreen(actor: actor)
        }
    }
}

#Preview {
    ActorListView(actors: [])
}
