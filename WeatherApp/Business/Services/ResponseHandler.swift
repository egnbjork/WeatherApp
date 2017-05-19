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
import AlamofireObjectMapper
import ObjectMapper

class ResponseHandler {
    
    func getData<T:BaseMappable>(url: OpenWeatherURL) -> T? {
        let queue = DispatchQueue(label: "com.berberyan.ResponseHandler")
        let group = DispatchGroup()
        group.enter()
        var data:T?
        Alamofire.request(url.getURL()).responseObject(queue: queue) {
            (response: DataResponse<T>) in
                if let fetchedResponse = response.result.value {
                    data = fetchedResponse
                } else {
                    print ("can't fetch the result")
                }
            group.leave()
        }
        group.wait()
        return data
    }

}
