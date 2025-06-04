//
//  MovieEntity+CoreDataProperties.swift
//  CineSphere
//
//  Created by Fernanda Perovano on 21/05/25.
//
//

import Foundation
import CoreData


extension MovieEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieEntity> {
        return NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var descriptionText: String?
    @NSManaged public var imageName: String?
    @NSManaged public var releaseYear: String?
    @NSManaged public var detailedDescription: String?
    @NSManaged public var mainactors: NSObject?
    @NSManaged public var rating: Int16

}

extension MovieEntity : Identifiable {

}
