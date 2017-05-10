//
//  ViewController.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/25/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let currentWeather = CurrentWeatherCustomCity().getCurrentWeather()
        if currentWeather != nil {
            if currentWeather!.cityName != nil {
                print("Weather is for the city of \((currentWeather!.cityName!))")
            }
            if currentWeather!.temperature != nil {
                print("now is \((currentWeather!.temperature!) - 273.15)ºC")
            }
            if currentWeather!.temperatureMax != nil {
                print("with max temp of: \((currentWeather!.temperatureMax!) - 273.15)ºC")
            }
            if currentWeather!.temperatureMax != nil {
                print("with min temp of: \((currentWeather!.temperatureMin!) - 273.15)ºC")
            }
            if currentWeather!.main != nil {
                print("weather: \((currentWeather!.main!))")
            }
            if currentWeather!.description != nil {
                print("detais: \((currentWeather!.description!))")
            }
            if currentWeather!.pressure != nil {
                print("pressure: \(currentWeather!.pressure!) hPa")
            }
            if currentWeather!.humidity != nil {
                print("humidity: \(currentWeather!.humidity!)%")
            }
            if currentWeather!.visibility != nil {
                print("visibility: \(currentWeather!.visibility!) meters")
            }
            if currentWeather!.clouds != nil {
                print("cloudiness: \(currentWeather!.clouds!)%")
            }
            if currentWeather!.sunrise != nil {
                print("sunrise: \(currentWeather!.sunrise!.description(with: Locale.current))")
            }
            if currentWeather!.sunset != nil {
                print("sunset: \(currentWeather!.sunset!.description(with: Locale.current))")
            }
            if currentWeather!.wind.direction != nil {
                print("wind headed at \(currentWeather!.wind.direction!)º")
            }
            if currentWeather!.wind.speed != nil {
                print("wind speed: \(currentWeather!.wind.speed!) m/s")
            }
            print("weather is valid for \(currentWeather!.date.description(with: Locale.current))")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

