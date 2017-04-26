//
//  CityModel.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

public class CityModel {
    var countryCode: String?
    var id: Int64?
    var latitude: Double?
    var longtitude: Double?
    var name: String?
    var user: UserModel?
    var currentWeather: Weather?
    var forecast: [Weather]?
    
}
