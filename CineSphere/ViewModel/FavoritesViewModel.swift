//
//  SwiftUIView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 06/02/25.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    @Published var favoriteMovies: [Movie] = []
    
    func toggleFavorite(movie: Movie) {
        if favoriteMovies.contains(where: { $0.id == movie.id }) {
            favoriteMovies.removeAll { $0.id == movie.id }
        } else {
            favoriteMovies.append(movie)
        }
    }
    
    func isFavorite(movie: Movie) -> Bool {
        return favoriteMovies.contains(where: { $0.id == movie.id })
    }
}

