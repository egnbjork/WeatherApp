//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import ObjectMapper

public class Weather: Mappable {
    //MARK: public variables
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
    var city:City?
    
    public required init?(map: Map) {
        self.wind = Wind()
        date = Date()
    }
    
    public func mapping(map: Map) {
        cityName <- map["name"]
        pressure <- map["main.pressure"]
        humidity <- map["main.humidity"]
        visibility <- map["visibility"]
        clouds <- map["clouds.all"]
        main <- map["weather.0.main"]
        description <- map["weather.0.description"]
        wind.direction <- map["wind.deg"]
        
        var windSpeedRaw: Double?
        var temperatureRaw: Double?
        var temperatureMaxRaw: Double?
        var temperatureMinRaw: Double?
        var sunriseRaw: Int?
        var sunsetRaw: Int?
        
        windSpeedRaw <- map["wind.speed"]
        temperatureRaw <- map["main.temp"]
        temperatureMaxRaw <- map["main.temp_max"]
        temperatureMinRaw <- map["main.temp_min"]
        sunriseRaw <- map["sys.sunrise"]
        sunsetRaw <- map["sys.sunset"]
        
        setTemperature(temperature: temperatureRaw)
        setTemperatureMax(temperatureMax: temperatureMaxRaw)
        setTemperatureMin(temperatureMin: temperatureMinRaw)
        setSunrise(sunrise: sunriseRaw)
        setSunset(sunset: sunsetRaw)
        
        wind.setSpeed(speed: windSpeedRaw)
    }
        
    //MARK: private setters
    private func setTemperature(temperature: Double?) {
        if temperature != nil {
            self.temperature = Measurement(value: temperature!, unit: UnitTemperature.kelvin)
        }
    }
    
    private func setTemperatureMax(temperatureMax: Double?) {
        if temperatureMax != nil {
            self.temperatureMax = Measurement(value: temperatureMax!, unit: UnitTemperature.kelvin)
        }
    }
    
    private func setTemperatureMin(temperatureMin: Double?) {
        if temperatureMax != nil {
            self.temperatureMin = Measurement(value: temperatureMin!, unit: UnitTemperature.kelvin)
        }
    }
    
    private func setSunrise(sunrise: Int?) {
        if sunrise != nil {
            self.sunrise = Date(timeIntervalSince1970: TimeInterval(String(describing: sunrise!))!)
        }
    }
    
    private func setSunset(sunset: Int?) {
        if sunset != nil {
            self.sunset = Date(timeIntervalSince1970: TimeInterval(String(describing: sunset!))!)
        }
    }
}
