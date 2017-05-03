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
    
    var parser: (AnyObject) -> [Weather]
    
    init(parser: @escaping (AnyObject) -> [Weather]) {
        self.parser = parser
    }
    
    func getData(url: OpenWeatherURL, completion:@escaping ([Weather]) -> Void) {
        print("parser.getData() invoked")
        var data = [Weather]()
        Alamofire.request(url.getURL())
            .responseJSON { response in
                if let entry = response.result.value {
                    data = self.parser(entry as AnyObject)
                    print("inside the closure data capacity is \(data.capacity)")
                    data[0].temperature = 15.0 //for debug only
                    print("temp inside parser is \(data[0].temperature)")
                    completion(data)
                }
                else {
                    print("response is nil")
                }
        }
        print("data capacity is \(data.capacity)")
    }
}
