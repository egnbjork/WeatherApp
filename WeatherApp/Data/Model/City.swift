//
//  CityModel.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import Mapper

public class City: Mappable {
    var countryCode: String
    var id: Int64
    var latitude: Double
    var longtitude: Double
    var name: String
    
    init(countryCode: String, cityName: String, id: Int64, latitude: Double, longtitude: Double) {
        self.countryCode = countryCode
        self.name = cityName
        self.id = id
        self.latitude = latitude
        self.longtitude = longtitude
    }
    
    public required init(map: Mapper) throws {
        name = try map.from("name")
        countryCode = try map.from("country")
        latitude = try map.from("coord.lat")
        longtitude = try map.from("coord.lon")
        let idMapping:Int = try map.from("id")
        id = Int64(idMapping)
    }
}
