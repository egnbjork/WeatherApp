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
    var main: String?
    var description: String?
    var base: String?
    var pressure: Double?
    var humidity: Int?
    var visibility: Int?
    var clouds: Int?
    var sunrise: Date?
    var sunset: Date?
    var temperature: Double?
    var temperatureMax: Double?
    var temperatureMin: Double?
    var cityName: String?
    var wind: Wind
    var date: Date
//    var city:City?
    private let weatherResponse:[WeatherResponse]
    
    public required init(map: Mapper) throws {
        self.temperature = map.optionalFrom("main.temp")
        self.cityName = map.optionalFrom("name")
        pressure = map.optionalFrom("main.pressure")
        humidity = map.optionalFrom("main.humidity")
        visibility = map.optionalFrom("visibility")
        clouds = map.optionalFrom("clouds.all")
        temperatureMax = map.optionalFrom("main.temp_max")
        temperatureMin = map.optionalFrom("main.temp_min")
        
        let sunriseRaw: Int? = map.optionalFrom("sys.sunrise")
        if sunriseRaw != nil {
            sunrise = Date(timeIntervalSince1970: TimeInterval(String(sunriseRaw!))!)
        }
        let sunsetRaw: Int? = map.optionalFrom("sys.sunset")
        if sunsetRaw != nil {
            sunset = Date(timeIntervalSince1970: TimeInterval(String(sunsetRaw!))!)
        }
        
        self.wind = Wind()
        wind.direction = map.optionalFrom("wind.deg")
        wind.speed = map.optionalFrom("wind.speed")
        
        weatherResponse = map.optionalFrom("weather") ?? []
        main = weatherResponse[0].main
        description = weatherResponse[0].description
        date = Date()
    }
    
    private class WeatherResponse: Mappable {
        var main: String?
        var description: String?
        
        required init(map: Mapper) throws {
            try main = map.from("main")
            try description = map.from("description")
        }
    }
}
