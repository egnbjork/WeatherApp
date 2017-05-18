//
//  WeatherHandler.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 5/16/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

class WeatherHandler {
    func getWeather(url: OpenWeatherURL) -> Weather? {
        if let data = ResponseHandler().getData(url: url) {
            return Weather.from(data)
        }
        return nil
    }
}
