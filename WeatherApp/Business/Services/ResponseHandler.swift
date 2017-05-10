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
    
    func getData(url: OpenWeatherURL) -> AnyObject? {
        let queue = DispatchQueue(label: "com.berberyan.ResponseHandler")
        let group = DispatchGroup()
        group.enter()
        var data:AnyObject?
        Alamofire.request(url.getURL())
            .responseJSON(queue: queue) {
                response in
                    if let json = response.result.value {
                        data = Weather.from(json as! NSDictionary)
                }
            group.leave()
        }
        group.wait()
        return data
    }
}
