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
        json = parseCityJson()
        let city = json?.filter{
            (_, entry) in entry["name"] == JSON(cityName) && entry["country"] == JSON(countryCode)
            }
            .map{
                (_, entry) -> City in
                return
                    City(countryCode: String(describing: entry["country"]),
                         cityName: String(describing: entry["name"]),
                         id: Int64(String(describing: entry["id"]))!,
                         latitude: Double(String(describing: entry["coord"]["lat"]))!,
                         longtitude: Double(String(describing: entry["coord"]["lon"]))!)
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
    
    //TODO: for location search
    func getCity(latitude: Double, longtitude: Double) -> City? {
        return nil
    }
    
    private func parseCityJson() -> JSON? {
        let path = Bundle.main.path(forResource: "city.list", ofType: "json")
        let jsonData = try? NSData(contentsOfFile: path!, options: NSData.ReadingOptions.mappedIfSafe)
        if let jsonResult = try? JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) {
            return JSON(jsonResult)
        }
        else {
            print("cannot parse json")
            return nil
        }
    }
}
