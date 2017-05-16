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
    
    func getCitiesFromStorage() -> [CityModel]? {
        let json = readCityJson()
        var cities = [CityModel]()
        
        for i in  0 ..< json!.count {
            let countryCode = String(describing: json![i]["country"])
            let cityName = String(describing: json![i]["name"])
            let id = Int64(String(describing: json![i]["id"]))!
            let latitude = Double(String(describing: json![i]["coord"]["lat"]))!
            let longtitude = Double(String(describing: json![i]["coord"]["lon"]))!
            let city = CityModel(countryCode: countryCode, cityName: cityName, id: id, latitude: latitude, longtitude: longtitude)
            cities.append(city)
            print(countryCode)
            print(cityName)
            print(id)
            print(latitude)
            print(longtitude)
            print(json![i])
        }
        return cities
    }
    
    private func readCityJson() -> JSON? {
        let path = Bundle.main.path(forResource: "city.list", ofType: "json")
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        if let jsonResult = try? JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) {
            return JSON(jsonResult)
        }
        else {
            return nil
        }
    }
    
    //TODO: sync array to db
    
    //TODO: get city id of particular name
    //check in db first
    
    //TODO: get city id of particular coordinates
    //check in db first
}
