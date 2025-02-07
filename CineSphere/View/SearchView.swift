//
//  SearchView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 26/01/25.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Buscar filmes...", text: $viewModel.searchText)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)

                List(viewModel.filteredMovies) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        Text(movie.title)
                            .font(.headline)
                            .padding(.vertical, 5)
                    }
                }
            }
            .navigationTitle("🔍 Buscar Filmes")
        }
    }
}

#Preview {
    ContentView().environmentObject(FavoritesViewModel())
}
