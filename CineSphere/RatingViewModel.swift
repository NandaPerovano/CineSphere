//
//  RatingViewModel.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 04/06/25.
//

import Foundation
import CoreData

class RatingViewModel: ObservableObject {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func saveRating(for title: String, value: Int) {
        let fetchRequest: NSFetchRequest<RateMovie> = RateMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)

        do {
            let results = try context.fetch(fetchRequest)
            let rating = results.first ?? RateMovie(context: context)
            rating.title = title
            rating.rating = Int16(value)
            try context.save()
        } catch {
            print("Erro ao salvar rating: \(error)")
        }
    }

    func fetchRating(for title: String) -> Int {
        let fetchRequest: NSFetchRequest<RateMovie> = RateMovie.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", title)

        do {
            let results = try context.fetch(fetchRequest)
            return Int(results.first?.rating ?? 0)
        } catch {
            print("Erro ao buscar rating: \(error)")
            return 0
        }
    }
}
