//
//  Settings+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import CoreData


extension Settings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Settings> {
        return NSFetchRequest<Settings>(entityName: "Settings")
    }

    @NSManaged public var bad_weather: Bool
    @NSManaged public var best_weather: Bool
    @NSManaged public var daylight_time: Bool
    @NSManaged public var isCelcius: Bool
    @NSManaged public var night_mode: Bool
    @NSManaged public var weather_review: Bool
    @NSManaged public var extreme_weather: ExtremeWeather?
    @NSManaged public var user: User?

}
