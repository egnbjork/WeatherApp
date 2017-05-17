//
//  User+CoreDataProperties.swift
//  
//
//  Created by Yevgen Berberyan on 5/17/17.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var login: String
    @NSManaged public var password: String
    @NSManaged public var cities: CityList?
    @NSManaged public var settings: Settings?

}
