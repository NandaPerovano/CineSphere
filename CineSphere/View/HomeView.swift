//
//  HomeView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 26/01/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

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

    var body: some View {
        HStack {
            Image(movie.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 120)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    ContentView()
}
