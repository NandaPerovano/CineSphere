//
//  SwiftUIView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 06/02/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel

    var body: some View {
        NavigationStack {
            List(favoritesViewModel.favoriteMovies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    MovieRow(movie: movie)
                }
            }
            .navigationTitle("❤️ Favoritos")
        }
    }
}

