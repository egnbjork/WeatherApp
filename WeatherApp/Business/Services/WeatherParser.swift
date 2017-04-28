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
    
    var currentWeather = {
        (_: AnyObject) -> [Weather] in
        let json = JSON(entry)
        var dict:Dictionary<String, JSON> = [:]
        var weatherArr = [Weather]()
        var weather = Weather()
        
        for (key, value) in json {
            switch key {
            case "name":
                weather.name = String(describing: value)
                dict["name"] = value
            case "base":
                dict["base"] = value
            case "weather":
                for (subKey, subValue) in json["weather"][0] {
                    switch subKey {
                    case "main":
                        dict["main"] = subValue
                    case "description":
                        dict["description"] = subValue
                    default: break
                    }
                }
            case "main":
                for (subKey, subValue) in json["main"] {
                    switch subKey {
                    case "pressure":
                        dict["pressure"] = subValue
                    case "humidity":
                        dict["humidity"] = subValue
                    case "temp":
                        dict["temp"] = subValue
                    case "temp_min":
                        dict["temp_min"] = subValue
                    case "temp_max":
                        dict["temp_max"] = subValue
                    default: break
                    }
                }
            case "visibility":
                dict["visibility"] = value
            case "clouds":
                dict["clouds"] = value["all"]
            case "sys":
                for (subKey, subValue) in json["sys"] {
                    switch subKey {
                    case "sunrise":
                        dict["sunrise"] = subValue
                    case "sunset":
                        dict["sunset"] = subValue
                    default:break
                    }
                }
            case "wind":
                for (subKey, subValue) in json["wind"] {
                    switch subKey {
                    case "speed":
                        dict["windspeed"] = subValue
                    case "deg":
                        dict["winddeg"] = subValue
                    default:break
                    }
                }
            default: break
            }
        }
        weatherArr.append(weather)
        return weatherArr
    }
}
