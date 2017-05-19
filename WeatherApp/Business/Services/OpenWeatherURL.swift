//
//  OpenWeatherURL.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/28/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

class OpenWeatherURL {
    var baseURL: String
    let APPID: String
    var city: City
    
    init(city: City) {
        self.city = city
        baseURL = "http://api.openweathermap.org/data/2.5/weather"
        APPID = "1237fcee037ac052bf06aad869f9f17a"
    }
    
    func getURL() -> String {
        return "\(baseURL)?id=\(city.cityId!)&APPID=\(APPID)"
    }
}
