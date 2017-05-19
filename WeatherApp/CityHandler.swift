//
//  CityHandler.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 5/16/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper
import CoreData

class CityHandler {
    private var json:JSON?
    
    func getCity(cityName: String, countryCode: String) -> City? {
        if let dbCity = getCityFromDb(cityName: cityName, countryCode: countryCode) {
            return dbCity
        }
        
        guard let city = getCityFromStorage(cityName: cityName, countryCode: countryCode)
            else {
                return nil
        }
        
        _ = storeCityToDb(city: city)
        return city
    }
    
    //TODO: for location search
    func getCity(latitude: Double, longtitude: Double) -> City? {
        return nil
    }
    
    //MARK: DB operations
    private func storeCityToDb(city: City) {
        print("storing in db")
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CityList", in: managedContext)!
        
        let cityListEntry = NSManagedObject(entity: entity, insertInto: managedContext)
        
        cityListEntry.setValue(city.cityId, forKey: "id")
        cityListEntry.setValue(city.countryCode, forKey: "country_code")
        cityListEntry.setValue(city.name, forKey: "name")
        cityListEntry.setValue(city.latitude, forKey: "latitude")
        cityListEntry.setValue(city.longtitude, forKey: "longtitude")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    private func getCityFromDb(cityName: String, countryCode: String) -> City? {
        print("fetching from db")
        var cities:[NSManagedObject] = []
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
            
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CityList")
        let predicate = NSPredicate(format: "name == %@ AND country_code == %@", cityName, countryCode)
        fetchRequest.predicate = predicate
        
        do {
            cities = try managedContext.fetch(fetchRequest)
            print("db cities size is \(cities.count)")
            return managedObjecttoModel(object: cities)
        } catch let error as NSError {
            print("error caught")
            print(error)
        }
        print("nothing found")
        return nil
    }
    
    private func managedObjecttoModel(object: [NSManagedObject]) -> City? {
        if object.count != 1 {
            return nil
        }
        print("managedObjecttoModel() invoked")
        print(object.count)
        let cityName: String = object[0].value(forKey: "name") as! String
        let countryCode: String = object[0].value(forKey: "country_code") as! String
        let id: Int64 = object[0].value(forKey: "id") as! Int64
        let latitude:Double = object[0].value(forKey: "latitude") as! Double
        let longtitude:Double = object[0].value(forKey: "longtitude") as! Double
        return City(countryCode: countryCode, cityName: cityName, id: id, latitude: latitude, longtitude: longtitude)
    }
    
    //MARK: Storage operations
    private func getCityFromStorage(cityName: String, countryCode: String) -> City? {
        json = parseCityJson()
        let city = json?.filter{
            (_, entry) in entry["name"] == JSON(cityName) && entry["country"] == JSON(countryCode)
            }
            .map{
                (_, entry) -> City? in
                if entry.dictionaryObject != nil {
                    return Mapper<City>().map(JSON: entry.dictionaryObject!)
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
