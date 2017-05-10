//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import Mapper

public class Weather: Mappable {
//    var main: String?
//    var name: String?
//    var description: String?
//    var base: String?
//    var pressure: Double?
//    var humidity: Int?
//    var visibility: Int?
//    var clouds: Int?
//    var date: Date?
//    var sunrise: Date?
//    var sunset: Date?
//    var wind: Wind?
    var temperature: Double?
//    var temperatureMax: Double?
//    var temperatureMin: Double?
//    var city:City? 

    public required init(map: Mapper) throws {
        try temperature = map.from("main.temp")
    }
}
