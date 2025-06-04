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
    @AppStorage("userName") private var name: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                if !name.isEmpty {
                    Text("Olá, \(name)!")
                        .italic()
                        .font(.largeTitle)
                        //.bold()
                        .foregroundStyle(.red)
                        .padding(.horizontal)
                        .padding(.top, 8)
                }
                List(viewModel.movies) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieRow(movie: movie)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color(.systemGray6))
                }
                .listStyle(.plain)
                .navigationTitle("🎬 Filmes")
            }
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
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(movie.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Spacer() 
                    
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
    ContentView().environmentObject(FavoritesViewModel()) 
}
