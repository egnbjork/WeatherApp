//
//  CityModel.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

public class City {
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
}
