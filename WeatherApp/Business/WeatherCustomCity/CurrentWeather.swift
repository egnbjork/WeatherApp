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
    
    func getCurrentWeather() -> Weather? {
        let weatherUrl = OpenWeatherURL()
        if(shouldUpdate()) {
            currentWeather = ResponseHandler().getData(url: weatherUrl) as? Weather
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
