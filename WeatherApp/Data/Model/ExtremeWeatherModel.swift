//
//  ExtremeWeatherModel.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

public class ExtremeWeatherModel {
    var temp: Double
    var tempMax: Double
    var tempMin: Double
    var visibility: Int32
    var windMax: Double
    
    init(extremeWeather: ExtremeWeather) {
        self.temp = extremeWeather.temp
        self.tempMax = extremeWeather.temp_max
        self.tempMin = extremeWeather.temp_min
        self.visibility = extremeWeather.visibility
        self.windMax = extremeWeather.wind_max
    }
    
}
