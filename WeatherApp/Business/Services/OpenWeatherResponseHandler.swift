//
//  OpenWeatherResponseHandler.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 5/1/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class OpenWeatherResponseHandler {
    func getData(url: OpenWeatherURL, parser: @escaping (AnyObject) -> [Weather]) -> [Weather] {
        print("getData() invoked")
        var data = [Weather]()
        Alamofire.request(url.getURL())
            .responseJSON { response in
                if let entry = response.result.value {
//                    print("response is not nil")
//                    print(entry)
//                    print("parsed data")
//                    let json = JSON(entry)
//                    print("city name: ")
//                    print(json["name"])
                    data = parser(entry as AnyObject)
                    print("inside the closure data capacity is \(data.capacity)")
                }
                else {
                    print("response is nil")
                }
        }
        print("data capacity is \(data.capacity)")
        return data
    }
}
