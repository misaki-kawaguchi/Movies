//
//  MoviesApp.swift
//  Movies
//
//  Created by 川口美咲 on 2024/04/29.
//

import SwiftUI
import SwiftData

@main
struct MoviesApp: App {
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: Movie.self, migrationPlan: MoviesMigrationPlan.self, configurations: ModelConfiguration(for: Movie.self))
        } catch {
            fatalError("Could not initialize container.")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MovieListScreen()
            }
        }.modelContainer(container)
    }
}
