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
    
    func getData(url: OpenWeatherURL, completion: @escaping (AnyObject) -> Void) {
        
        let group = DispatchGroup()
        group.enter()
        
        print("ResponseHandler.getData() invoked")
        Alamofire.request(url.getURL())
            .responseJSON {
                response in
                if let entry = response.result.value {
                    completion(entry as AnyObject)
                    print("getData request() body")
                }
            group.leave()
        }
        print("alamofire waiting")
        group.wait()
        print("alamofire finished")
    }
}
