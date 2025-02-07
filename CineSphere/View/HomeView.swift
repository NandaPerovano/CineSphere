//
//  HomeView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 26/01/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel

    var body: some View {
        NavigationView {
            List(viewModel.movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    MovieRow(movie: movie)
                }
            }
            .navigationTitle("🎬 Filmes")
        }
    }
}

struct MovieRow: View {
    let movie: Movie
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel

    var body: some View {
        HStack {
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 120)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(movie.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer() // Empurra o botão para a direita
                    
                    Button(action: {
                        favoritesViewModel.toggleFavorite(movie: movie)
                    }) {
                        Image(systemName: favoritesViewModel.isFavorite(movie: movie) ? "heart.fill" : "heart")
                            .foregroundColor(favoritesViewModel.isFavorite(movie: movie) ? .red : .gray)
                            .font(.title2)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    ContentView().environmentObject(FavoritesViewModel()) // Passa o ViewModel corretamente
}
