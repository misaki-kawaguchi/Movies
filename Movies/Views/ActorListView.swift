//
//  ActorListView.swift
//  Movies
//
//  Created by 川口美咲 on 2024/05/02.
//

import SwiftUI

struct ActorListView: View {
    let actors: [Actor]
    
    var body: some View {
        List(actors) { actor in
            ActorCellView(actor: actor)
        }
    }
}

#Preview {
    ActorListView(actors: [])
}
