//
//  MoviesApp.swift
//  Movies
//
//  Created by 川口美咲 on 2025/03/15.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MovieListScreen()
            }
        }
        .modelContainer(for: [Movie.self])
    }
}
