//
//  HomeViewModel.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 31/01/25.
//


import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    init() {
        fetchMovies()
    }

    func fetchMovies() {
           movies = MovieService.shared.movies 
       }
}

