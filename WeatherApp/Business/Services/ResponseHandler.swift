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
    
    func getJSON(url: OpenWeatherURL) -> JSON? {
        let queue = DispatchQueue(label: "com.berberyan.ResponseHandler")
        let group = DispatchGroup()
        group.enter()
        var data:JSON?
        Alamofire.request(url.getURL())
            .responseJSON(queue: queue) {
                response in
                    if let json = response.result.value as? JSON {
                        data = json
                }
            group.leave()
        }
        group.wait()
        return data
    }
    
    func getNSDictionary(url: OpenWeatherURL) -> NSDictionary? {
        let queue = DispatchQueue(label: "com.berberyan.ResponseHandler")
        let group = DispatchGroup()
        group.enter()
        var data:NSDictionary?
        Alamofire.request(url.getURL())
            .responseJSON(queue: queue) {
                response in
                if let json = response.result.value as? NSDictionary {
                    data = json
                }
                group.leave()
        }
        group.wait()
        return data
//        return getJSON(url: url)?.dictionary as! NSDictionary
    }

}
