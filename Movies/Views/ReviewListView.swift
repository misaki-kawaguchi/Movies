//
//  ReviewListView.swift
//  Movies
//
//  Created by 川口美咲 on 2024/05/01.
//

import SwiftUI
import SwiftData

struct ReviewListView: View {
    let reviews: [Review]
    @Environment(\.modelContext) private var context
    
    private func deleteReview(IndexSet: IndexSet) {
        IndexSet.forEach { index in
            let review = reviews[index]
            context.delete(review)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(reviews) { review in
                VStack {
                    Text(review.subject)
                    Text(review.body)
                }
            }
            .onDelete(perform: deleteReview)
        }
    }
}

#Preview {
    ReviewListView(reviews: [])
        .modelContainer(for: [Review.self, Movie.self])
}
