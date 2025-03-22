//
//  ReviewListView.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/22.
//

import SwiftUI

struct ReviewListView: View {
    
    let movie: Movie
    @Environment(\.modelContext) private var context
    
    private func deleteReview(indexSet: IndexSet) {
        indexSet.forEach { index in
            let review = movie.reviews[index]
            context.delete(review)
            
            do {
                movie.reviews.remove(at: index)
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List {
            ForEach(movie.reviews) { review in
                VStack(alignment: .leading) {
                    Text(review.subject)
                    Text(review.body)
                }
            }
            .onDelete(perform: deleteReview)
        }
    }
}

//#Preview {
//    ReviewListView(reviews: [])
//        .modelContainer(for: [Review.self, Movie.self])
//}
