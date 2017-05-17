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
    var city: City? //not implemented (remove Optional)
    
//    init(city: CityModel) { //not implemented
//        self.city = city //not implemented
    init() { //remove
        baseURL = "http://api.openweathermap.org/data/2.5/weather"
        APPID = "1237fcee037ac052bf06aad869f9f17a"
    }
    
    func getURL() -> String {
       return "\(baseURL)?id=698740&APPID=\(APPID)" //remove
        
//        return "\(baseURL)?id=\(city.id)&APPID=\(APPID)" //not implemented
    }
}
