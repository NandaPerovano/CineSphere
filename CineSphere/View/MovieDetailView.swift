//
//  MovieDetailView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 02/02/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var rating: Int = 0 
    @EnvironmentObject var ratingVM: RatingViewModel
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(movie.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .shadow(radius: 5)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .bold()
                        .padding(.bottom, 20)
                    
                    HStack(spacing: 16) {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= rating ? "star.fill" : "star")
                                .foregroundColor(index <= rating ? .red : .gray)
                                .font(.system(size: 16))
                                .onTapGesture {
                                    rating = index
                                    ratingVM.saveRating(for: movie.title, value: index)
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("Ano de lançamento:")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                        Text("\(movie.releaseYear)")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                    }
                }
                
                Divider()
                
                Text("Sinopse")
                    .font(.headline)
                    .foregroundColor(.red)
                
                Text(movie.detailedDescription)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Divider()
                
                Text("Elenco Principal")
                    .font(.headline)
                    .foregroundColor(.red)
                
                ForEach(movie.mainActors, id: \..self) { actor in
                    Text(actor)
                        .bold()
                        .italic()
                        .font(.body)
                        .foregroundColor(.primary)
                }
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            rating = ratingVM.fetchRating(for: movie.title)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView().environmentObject(FavoritesViewModel())
}
