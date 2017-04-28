//
//  OpenWeatherHandler.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/28/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class OpenWeatherRequestHandler {
    var url:OpenWeatherURL
    
    init(url: OpenWeatherURL) {
        self.url = url
    }
    
    func getRawResponse(parser: @escaping ((AnyObject) -> [Weather])) -> [Weather] {
        var weatherArr = [Weather]()
        Alamofire.request(url.getURL())
            .responseJSON { response in
                if let entry = response.result.value {
                    weatherArr = parser(entry as AnyObject)
                }
                else {
                    print("response is nil")
                }
        }
        return weatherArr
    }
}
