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
    
    func getRawResponse() {
        Alamofire.request(url.getURL())
            .responseJSON { response in
                if let entry = response.result.value {
//                    print(entry)
//                    print("entry type of \(type(of: entry))")
//                    let json = JSON(entry)
//                    print("city name: ")
//                    print(json["name"])
                    let closure = {
                        (_: AnyObject) -> [String : JSON] in
                        let json = JSON(entry)
//                        print(json["name"])
                        
                        var dict:Dictionary<String, JSON> = [:]
                        
                        for (key, value) in json {
                            switch key {
                                case "name":
                                    dict["name"] = value
                                case "base":
                                    dict["base"] = value
                                case "weather":
                                    for (subKey, subValue) in json["weather"][0] {
                                        switch subKey {
                                            case "main":
                                                dict["main"] = subValue
                                            case "description":
                                                dict["description"] = subValue
                                            default: break
                                        }
                                    }
                                case "main":
                                    for (subKey, subValue) in json["main"] {
                                        switch subKey {
                                            case "pressure":
                                                dict["pressure"] = subValue
                                            default: break
                                        }
                                }
                            default: break
                            }
                        }
                        
//                        var clouds: Int?
//                        var date: Date?
//                        var sunrise: Date?
//                        var sunset: Date?
//                        var wind: Wind?
//                            "visibility" : json["visibility"]
//                        
//                        for (key, value) in json["main"] {
//                            dict[key] = value
//                        }
                        
                        return dict
                    }
                    print(closure(entry as AnyObject))
                }
                else {
                    print("response is nil")
                }
        }
        
    }
}
