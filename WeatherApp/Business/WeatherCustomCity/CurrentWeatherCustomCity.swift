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
        let weatherUrl = OpenWeatherURL()
        return ResponseHandler().getData(url: weatherUrl) as? Weather
    }
}
