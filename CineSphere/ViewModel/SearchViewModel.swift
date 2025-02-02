//
//  SwiftUIView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 02/02/25.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var searchText: String = ""

    init() {
        fetchMovies()
    }

    func fetchMovies() {
           movies = MovieService.shared.movies 
       }

    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return movies
        } else {
            return movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}


