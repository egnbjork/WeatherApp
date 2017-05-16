//
//  CityHandler.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 5/16/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import SwiftyJSON
import CoreData

class CityHandler {
    
    func getAllCities() -> [NSManagedObject]? {
        var cities:[NSManagedObject] = []
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "City")
        
        do {
            cities = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print(error)
        }
        
        return cities
    }
    
    func syncDb() {
        let json = readCityJson()
        print("total \(json?.count) intries in json")
        var start = Date()

        for i in  0 ..< json!.count {
            let countryCode = String(describing: json![i]["country"])
            let cityName = String(describing: json![i]["name"])
            let id = Int64(String(describing: json![i]["id"]))!
            let latitude = Double(String(describing: json![i]["coord"]["lat"]))!
            let longtitude = Double(String(describing: json![i]["coord"]["lon"]))!
            let city = CityModel(countryCode: countryCode, cityName: cityName, id: id, latitude: latitude, longtitude: longtitude)
//            print(i)
//            print(countryCode)
//            print(cityName)
//            print(id)
//            print(latitude)
//            print(longtitude)
//            print(json![i])
            importToDb(cityModel: city)
        }
        print(start)
        print(Date())
        print("finished")
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
    private func importToDb(cityModel: CityModel) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "City", in: managedContext)!
        
        let city = NSManagedObject(entity: entity, insertInto: managedContext)
        
        city.setValue(cityModel.id, forKey: "id")
        city.setValue(cityModel.countryCode, forKey: "country_code")
        city.setValue(cityModel.name, forKey: "name")
        city.setValue(cityModel.latitude, forKey: "latitude")
        city.setValue(cityModel.longtitude, forKey: "longtitude")

        do {
            try managedContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    //TODO: get city id of particular name
    //check in db first
    
    //TODO: get city id of particular coordinates
    //check in db first
}
