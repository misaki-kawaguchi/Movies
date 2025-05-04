//
//  ActorCellView.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/23.
//

import SwiftUI

struct ActorCellView: View {
    
    let actor: Actor
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(actor.name)
            Text(actor.movies.map { $0.title }, format: .list(type: .and))
                .font(.caption)
        }
    }
}

//#Preview {
//    ActorCellView()
//}
