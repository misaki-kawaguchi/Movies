//
//  ActorSelectionView.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/23.
//

import SwiftUI
import SwiftData

struct ActorSelectionView: View {
    
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    
    var body: some View {
        List(actors) { actor in
            HStack {
                Image(systemName: "square")
                Text(actor.name)
            }
        }
    }
}

//#Preview {
//    ActorSelectionView()
//}
