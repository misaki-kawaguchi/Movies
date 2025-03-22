//
//  ReviewListView.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/22.
//

import SwiftUI

struct ReviewListView: View {
    
    let reviews: [Review]
    
    var body: some View {
        List {
            ForEach(reviews) { review in
                VStack(alignment: .leading) {
                    Text(review.subject)
                    Text(review.body)
                }
            }
        }
    }
}

#Preview {
    ReviewListView(reviews: [])
}
