//
//  ExtremeWeather+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import CoreData


extension ExtremeWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExtremeWeather> {
        return NSFetchRequest<ExtremeWeather>(entityName: "ExtremeWeather")
    }

    @NSManaged public var temp: Double
    @NSManaged public var temp_max: Double
    @NSManaged public var temp_min: Double
    @NSManaged public var visibility: Int32
    @NSManaged public var wind_max: Double
    @NSManaged public var settings: Settings?

}
