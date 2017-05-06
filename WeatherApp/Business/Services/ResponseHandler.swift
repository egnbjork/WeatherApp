//
//  ResponseHandler.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 5/3/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ResponseHandler {
    
    func getData(url: OpenWeatherURL) -> AnyObject {
        let queue = DispatchQueue(label: "WeatherJson")
        let group = DispatchGroup()
        group.enter()
        print("ResponseHandler.getData() invoked")
        let result = Alamofire.request(url.getURL())
            .responseJSON(queue: queue) {
                response in
                    print("=====download started")
                    if let entry = response.result.value {
//                        completion(entry as AnyObject)
                                print(("getCurrentWeather() \(Thread.current)"))
                        print("getData request() body")

                }
            group.leave()
        }
        print(("getDate thread is \(Thread.current)"))
        print("alamofire waiting")
        group.wait()
        print("=====alamofire finished")
        return result
    }
}
