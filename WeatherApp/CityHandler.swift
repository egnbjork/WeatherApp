//
//  CityHandler.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 5/16/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import SwiftyJSON

class CityHandler {
    //TODO: sync json file, extract array of citymodels
    
    func readCityJson() -> JSON {
        let path = Bundle.main.path(forResource: "city.list", ofType: "json")
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        let jsonResult: NSArray = try! JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        return JSON(jsonResult)
    }
    
    //TODO: sync array to db
    
    //TODO: get city id of particular name
    //check in db first
    
    //TODO: get city id of particular coordinates
    //check in db first
}
