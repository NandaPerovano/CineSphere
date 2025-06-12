//
//  SwiftUIView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 06/02/25.
//

import Foundation
import Combine

class FavoritesViewModel: ObservableObject {
    @Published var favoriteMovies: [Movie] = []
    
    private let storage = FavoriteMovieStorage()
    
    init() {
        fetchFavorites()
    }

    func toggleFavorite(movie: Movie) {
        if isFavorite(movie: movie) {
            storage.remove(title: movie.title)
        } else {
            storage.add(movie: movie)
        }
        fetchFavorites()
    }

    func isFavorite(movie: Movie) -> Bool {
        return storage.isFavorite(title: movie.title)
    }

    func fetchFavorites() {
        let stored = storage.fetchAll()
        self.favoriteMovies = stored.map { favorite in
            Movie(
                title: favorite.title ,
                description: favorite.description ,
                imageName: favorite.imageName,
                releaseYear: favorite.releaseYear ,
                detailedDescription: favorite.detailedDescription ,
                mainActors: favorite.mainActors 
            )
        }
    }
}


