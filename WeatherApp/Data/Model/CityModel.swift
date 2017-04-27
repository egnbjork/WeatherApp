//
//  CityModel.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

public class CityModel {
    var countryCode: String
    var id: Int64
    var latitude: Double
    var longtitude: Double
    var name: String
    var user: UserModel
    var currentWeather: Weather?
    var forecast: [Weather]?
    
    init (city: City, user: UserModel){
        self.countryCode = city.country_code
        self.id = city.id
        self.latitude = city.latitude
        self.longtitude = city.longtitude
        self.name = city.name
        self.user = user
    }
    
}
