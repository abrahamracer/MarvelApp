//
//  FavoriteChar+CoreDataProperties.swift
//  MarvelApp
//
//  Created by Abraham Valderrabano Vega on 10/05/24.
//
//

import Foundation
import CoreData


extension FavoriteChar {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteChar> {
        return NSFetchRequest<FavoriteChar>(entityName: "FavoriteChar")
    }

    @NSManaged public var resourceURI: String?
    @NSManaged public var descriptionChar: String?
    @NSManaged public var name: String?
    @NSManaged public var charId: UUID?
    @NSManaged public var thumbnail: String?

}

extension FavoriteChar : Identifiable {

}
