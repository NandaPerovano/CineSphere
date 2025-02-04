//
//  Movie.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 31/01/25.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    let releaseYear: Int
    let detailedDescription: String
    let mainActors: [String]
}

