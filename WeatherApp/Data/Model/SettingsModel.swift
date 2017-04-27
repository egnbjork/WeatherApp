//
//  SettingsModel.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

public class SettingsModel {
    var badWeather = false
    var bestWeather = false
    var daylightTime = false
    var isCelcius = false
    var nightMode = false
    var weatherReview = false
    var extremeWeather: ExtremeWeatherModel
    
    init (extremeWeather: ExtremeWeatherModel){
        self.extremeWeather = extremeWeather
    }
}
