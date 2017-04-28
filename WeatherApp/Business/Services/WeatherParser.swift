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
        (entry: AnyObject) -> [String : JSON] in
        let json = JSON(entry)
        print(json["name"])
        return ["name" : json["name"]]

    }
}
