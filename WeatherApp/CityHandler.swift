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
    private var json:JSON?
    
    func getCity(cityName: String, countryCode: String) -> City? {
        return getCityFromStorage(cityName: cityName, countryCode: countryCode)
    }
    
    //TODO: for location search
    func getCity(latitude: Double, longtitude: Double) -> City? {
        return nil
    }
    
    //MARK: Storage operations
    private func getCityFromStorage(cityName: String, countryCode: String) ->City? {
        json = parseCityJson()
        let city = json?.filter{
            (_, entry) in entry["name"] == JSON(cityName) && entry["country"] == JSON(countryCode)
            }
            .map{
                (_, entry) -> City? in
                if entry.dictionaryObject != nil {
                    let nsDict:NSDictionary = entry.dictionaryObject! as NSDictionary
                    return City.from(nsDict)
                } else {
                    print("cannot parse city list")
                    return nil
                }
        }
        
        if city == nil {
            print("no city found")
        }
        else if (city?.capacity)! > 2 {
            print("more than one city found")        }
        else {
            return city?[0]
        }
        
        return nil
    }
    
    private func parseCityJson() -> JSON? {
        let path = Bundle.main.path(forResource: "city.list", ofType: "json")
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        if let jsonResult = try? JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) {
        let json = JSON(jsonResult)
        return json
        }
        else {
            print("cannot parse json")
            return nil
        }
    }
}
