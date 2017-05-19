//
//  CityModel.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import ObjectMapper

public class City: Mappable {
    var countryCode: String?
    var cityId: Int64?
    var latitude: Double?
    var longtitude: Double?
    var name: String?
    
    init(countryCode: String, cityName: String, id: Int64, latitude: Double, longtitude: Double) {
        self.countryCode = countryCode
        self.name = cityName
        self.cityId = id
        self.latitude = latitude
        self.longtitude = longtitude
    }
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        name <- map["name"]
        countryCode <- map["country"]
        latitude <- map["coord.lat"]
        longtitude <- map["coord.lon"]
        var idMapping:Int?
        idMapping <- map["id"]
        if(idMapping != nil) {
            cityId = Int64(idMapping!)
        }
        
    }
}
