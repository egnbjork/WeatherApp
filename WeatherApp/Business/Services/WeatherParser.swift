//
//  CurrentWeatherParserJSON.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/28/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherParser {
    
    func currentWeather (entry: AnyObject) -> Weather {
        print("currentWeather() parser invoked")
        let json = JSON(entry)
        var dict:Dictionary<String, JSON> = [:]
        let weather = Weather()
        weather.date = Date()
        let wind = Wind()
        //objectmapper
        for (key, value) in json {
            switch key {
            case "name":
                weather.name = String(describing: value)
            case "base":
                weather.base = String(describing: value)
            case "weather":
                for (subKey, subValue) in json["weather"][0] {
                    switch subKey {
                    case "main":
                        weather.name = String(describing: subValue)
                    case "description":
                        weather.description = String(describing: subValue)
                    default: break
                    }
                }
            case "main":
                for (subKey, subValue) in json["main"] {
                    switch subKey {
                    case "pressure":
                        weather.pressure = Double(String(describing: subValue))
                    case "humidity":
                        weather.humidity = Int(String(describing: subValue))
                    case "temp":
                        weather.temperature = Double(String(describing: subValue))
                        print("parser temperature is \(String(describing: weather.temperature))")
                    case "temp_min":
                        dict["temp_min"] = subValue
                    case "temp_max":
                        dict["temp_max"] = subValue
                    default: break
                    }
                }
            case "visibility":
                weather.visibility = Int(String(describing: value))
            case "clouds":
                weather.visibility = Int(String(describing: value["all"]))
            case "sys":
                for (subKey, subValue) in json["sys"] {
                    switch subKey {
                    case "sunrise":
                        weather.sunrise = Date(timeIntervalSince1970: TimeInterval(String(describing: subValue))!)
                    case "sunset":
                        weather.sunset = Date(timeIntervalSince1970: TimeInterval(String(describing: subValue))!)
                    default:break
                    }
                }
            case "wind":
                for (subKey, subValue) in json["wind"] {
                    switch subKey {
                    case "speed":
                        wind.force = Int(String(describing: subValue))
                    case "deg":
                        wind.direction = String(describing: subValue)
                    default:break
                    }
                }
            default: break
            }
        }
        
        //insert wind to weather!!
        return weather
    }
}
