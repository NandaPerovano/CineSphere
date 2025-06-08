//
//  CineSphereApp.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 26/01/25.
//

import SwiftUI

@main
struct CineSphereApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    @StateObject private var ratingViewModel = RatingViewModel(context: PersistenceController.shared.container.viewContext)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesViewModel)
                .environmentObject(ratingViewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
