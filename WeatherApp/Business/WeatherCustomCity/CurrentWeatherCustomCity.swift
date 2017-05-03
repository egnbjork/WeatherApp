//
//  CurrentWeatherCustomCity.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/28/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

class CurrentWeatherCustomCity {
    
    func getCurrentWeather(completion: @escaping (Weather) -> Void ) -> Weather{
        let weatherUrl = OpenWeatherURL()
        let currentWeatherParser = WeatherParser().currentWeather
        var weatherArr:[Weather] = []
        var currentWeather = Weather()
        let weatherHandler = OpenWeatherResponseHandler(parser: currentWeatherParser)
        weatherHandler.getData(url: weatherUrl, completion: {
            (weatherArr) in
            print("callback invoked")
            print("callback capacity is \(weatherArr.capacity)")
            completion(weatherArr[0])
            print("temp inside callback is \(currentWeather.temperature)")
        }
        )
        print("temp outside callback is \(currentWeather.temperature)")
        return currentWeather
    }
}
