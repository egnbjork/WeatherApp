//
//  CityList+CoreDataProperties.swift
//  
//
//  Created by Yevgen Berberyan on 5/17/17.
//
//

import Foundation
import CoreData


extension CityList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CityList> {
        return NSFetchRequest<CityList>(entityName: "CityList")
    }

    @NSManaged public var country_code: String
    @NSManaged public var id: Int64
    @NSManaged public var latitude: Double
    @NSManaged public var longtitude: Double
    @NSManaged public var name: String
    @NSManaged public var user: User?

}
