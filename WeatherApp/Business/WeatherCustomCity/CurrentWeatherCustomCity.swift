//
//  CurrentWeatherCustomCity.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/28/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

class CurrentWeatherCustomCity {
    
    func getCurrentWeather() -> Weather? {
        print("getCurrentWeather() invoked")
        let weatherUrl = OpenWeatherURL()
        let weatherParser = WeatherParser()
        var weather: Weather?
        var rawData: AnyObject?
        
//        let weatherQueue = OperationQueue()
//        weatherQueue.maxConcurrentOperationCount = 1
        
//        weatherQueue.addOperation {
            print("=====first operation")
            rawData = ResponseHandler().getData(url: weatherUrl)
            print("=====first operation finished")


//        }
        
//        weatherQueue.addOperation {
            print("=====second operation")

            if (rawData != nil) {
                weather = weatherParser.currentWeather(entry: rawData!)
            }
            else {
                print("rawData is nil")
            }
            
            print("=====second operation finished")
//        }
        
//        print(("getCurrentWeather() \(Thread.callStackSymbols)"))
        
//            weatherQueue.waitUntilAllOperationsAreFinished()

        print("object temperature is \(String(describing: weather?.temperature))")
        return weather
    }
}
