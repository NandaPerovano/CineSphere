//
//  FavoriteMovieStorage.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 11/06/25.
//

import Foundation
import CoreData

class FavoriteMovieStorage {
    private let context = PersistenceController.shared.container.viewContext

    func fetchAll() -> [Movie] {
        let request: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        do {
            return try context.fetch(request).map { favorite in
                Movie(
                    title: favorite.title ?? "",
                    description: favorite.descriptionText ?? "",
                    imageName: favorite.imageName ?? "",
                    releaseYear: favorite.releaseYear ?? "",
                    detailedDescription: favorite.detailedDescription ?? "",
                    mainActors: favorite.mainActors?.components(separatedBy: ", ") ?? []
                )
            }
        } catch {
            print("Erro ao buscar favoritos: \(error)")
            return []
        }
    }


    func isFavorite(title: String) -> Bool {
        let request: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", title)
        do {
            return try context.fetch(request).first != nil
        } catch {
            print("Erro ao verificar favorito: \(error)")
            return false
        }
    }

    func add(movie: Movie) {
        let favorite = FavoriteMovie(context: context)
        favorite.title = movie.title
        favorite.imageName = movie.imageName
        favorite.descriptionText = movie.description
        favorite.releaseYear = movie.releaseYear
        favorite.detailedDescription = movie.detailedDescription
        favorite.mainActors = movie.mainActors.joined(separator: ", ")
        save()
    }

    func remove(title: String) {
        let request: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", title)
        do {
            if let favorite = try context.fetch(request).first {
                context.delete(favorite)
                save()
            }
        } catch {
            print("Erro ao remover favorito: \(error)")
        }
    }

    private func save() {
        do {
            try context.save()
        } catch {
            print("Erro ao salvar: \(error)")
        }
    }
}

