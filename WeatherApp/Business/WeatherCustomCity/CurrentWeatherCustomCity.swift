//
//  CurrentWeatherCustomCity.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/28/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

class CurrentWeatherCustomCity {
    
    func getCurrentWeather() -> Weather? {
        print("getCurrentWeather() invoked")
        let weatherUrl = OpenWeatherURL()
        let weatherParser = WeatherParser()
        var weather: Weather?
        var rawData: AnyObject?
        let weatherQueue = DispatchQueue(label: "com.berberyan.weatherQueue")
        
        weatherQueue.async() {
            rawData = ResponseHandler().getData(url: weatherUrl) {
                (rawData) in
                weather = weatherParser.currentWeather(entry: rawData as AnyObject)
                print(weather?.temperature)
            } as AnyObject
        }
        
        if (rawData != nil) {
            weather = weatherParser.currentWeather(entry: rawData!)
        }
        else {
            print("rawData is nil")
        }
        print("function returned")
        print("object temperature is \(String(describing: weather?.temperature))")
        return weather
    }
}
