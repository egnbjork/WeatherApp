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
    
    //MARK: initializers
    public required init(map: Mapper) throws {
        self.wind = Wind()
        date = Date()

        cityName = map.optionalFrom("name")
        pressure = map.optionalFrom("main.pressure")
        humidity = map.optionalFrom("main.humidity")
        visibility = map.optionalFrom("visibility")
        clouds = map.optionalFrom("clouds.all")
        wind.direction = map.optionalFrom("wind.deg")
        
        let windSpeedRaw: Double? = map.optionalFrom("wind.speed")
        let temperatureRaw: Double? = map.optionalFrom("main.temp")
        let temperatureMaxRaw: Double? = map.optionalFrom("main.temp_max")
        let temperatureMinRaw: Double? = map.optionalFrom("main.temp_min")
        let sunriseRaw: Int? = map.optionalFrom("sys.sunrise")
        let sunsetRaw: Int? = map.optionalFrom("sys.sunset")
        
        setTemperature(temperature: temperatureRaw)
        setTemperatureMax(temperatureMax: temperatureMaxRaw)
        setTemperatureMin(temperatureMin: temperatureMinRaw)
        setSunrise(sunrise: sunriseRaw)
        setSunset(sunset: sunsetRaw)
        
        wind.setSpeed(speed: windSpeedRaw)
                
        if let weatherResponse:[WeatherResponse] = map.optionalFrom("weather") {
            if !weatherResponse.isEmpty {
                main = weatherResponse[0].main
                description = weatherResponse[0].description

            }
        }
    }
    
    //MARK: nested helper class
    private class WeatherResponse: Mappable {
        var main: String?
        var description: String?
        
        required init(map: Mapper) throws {
            try main = map.from("main")
            try description = map.from("description")
        }
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
