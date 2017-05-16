//
//  CurrentWeatherCustomCity.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/28/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

class CurrentWeather {

    private var currentWeather: Weather?
    let dateformatter:DateFormatter

    init() {
        dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm"
        _ = getCurrentWeather()
    }
    
    func getTemperature() -> String? {
        if let temperature = currentWeather?.temperature?.converted(to: UnitTemperature.celsius).value {
            return String(format:"%.0f", temperature) + "º"
        } else {
            print("unable to acquire temperature")
            return nil
        }
    }
    
    func getHumidity() -> String? {
        if let humidity = currentWeather?.humidity {
            return String(describing: humidity) + " %"
        } else {
            print("unable to acquire humidity")
            return nil
        }
    }
    
    func getPressure() -> String? {
        if let pressure = currentWeather?.pressure {
            return String(describing: pressure) + " hPa"
        } else {
            print("unable to acquire pressure")
            return nil
        }
    }
    
    func getSunriseTime() -> String? {
        if let sunrise = currentWeather?.sunrise {
            return "⬆︎ " + dateformatter.string(from: sunrise)
        } else {
            print("unable to acquire sunset time")
            return nil
        }
    }
    
    func getSunsetTime() -> String? {
        if let sunset = currentWeather?.sunset {
            return "⬇︎ " + dateformatter.string(from: sunset)
        } else {
            print("unable to acquire sunset time")
            return nil
        }
    }
    
    func getWindSpeed() -> String? {
        if let windSpeed = currentWeather?.wind.speed?.converted(to: UnitSpeed.knots).value {
            return (String(format:"%.0f", windSpeed)) + " kn"
        } else {
            print("unable to acquire wind speed")
            return nil
        }
    }
    
    func getDescription() -> String? {
        return currentWeather?.description
    }
    
    
    func getCityName() -> String? {
        return currentWeather?.cityName
    }
    
    func getCurrentWeather() -> Weather? {
        let weatherUrl = OpenWeatherURL()
        if(shouldUpdate()) {
            currentWeather = WeatherHandler().getWeather(url: weatherUrl)
            
        }
        return currentWeather
    }
    
    private func shouldUpdate() -> Bool {
        if self.currentWeather != nil {
            //check if currentWeather is more than 10 min old
            return (currentWeather?.date.timeIntervalSinceNow)! > 10*60 ? true : false
        }
        return true
    }
}
