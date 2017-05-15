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
    var cityName: String?
    var temperature: Measurement<UnitTemperature>?
    var temperatureMax: Measurement<UnitTemperature>?
    var temperatureMin: Measurement<UnitTemperature>?
    var wind: Wind
    var date: Date
//    var city:City?
    private let weatherResponse:[WeatherResponse]
    
    public required init(map: Mapper) throws {
        if let temperatureKelvin:Double = map.optionalFrom("main.temp") {
            temperature = Measurement(value: temperatureKelvin, unit: UnitTemperature.kelvin)
        }
        if let temperatureMaxKelvin:Double = map.optionalFrom("main.temp_max") {
            temperatureMax = Measurement(value: temperatureMaxKelvin, unit: UnitTemperature.kelvin)
        }
        if let temperatureMinKelvin:Double = map.optionalFrom("main.temp_min") {
            temperatureMin = Measurement(value: temperatureMinKelvin, unit: UnitTemperature.kelvin)
        }
        
        cityName = map.optionalFrom("name")
        pressure = map.optionalFrom("main.pressure")
        humidity = map.optionalFrom("main.humidity")
        visibility = map.optionalFrom("visibility")
        clouds = map.optionalFrom("clouds.all")
        
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
        
        if let speedMps: Double = map.optionalFrom("wind.speed") {
            wind.speed = Measurement(value:speedMps, unit: UnitSpeed.metersPerSecond)
        }
        
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
