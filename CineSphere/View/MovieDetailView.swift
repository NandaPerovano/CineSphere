//
//  MovieDetailView.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 02/02/25.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

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

                ForEach(movie.mainActors, id: \.self) { actor in
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
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView()
}

