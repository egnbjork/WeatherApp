//
//  ViewController.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/25/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import UIKit
import SwiftyJSON

class CurrentWeatherViewController: UIViewController {
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!

    //MARK: Controller methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let city = CityHandler().getCity(cityName: "Odessa", countryCode: "UA") {
            let currentWeather = CurrentWeather(city: city)
            updateCurrentWeatherLabels(currentWeather: currentWeather)
            print(city.name)
        }
        else {
            print("cannot acquire current weather")
        }
    }

    //TODO:
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: helper methods
    private func updateCurrentWeatherLabels(currentWeather: CurrentWeather) {
        temperatureLabel.text = currentWeather.getTemperature()
        humidityLabel.text = currentWeather.getHumidity()
        pressureLabel.text = currentWeather.getPressure()
        sunriseLabel.text = currentWeather.getSunriseTime()
        sunsetLabel.text = currentWeather.getSunsetTime()
        windSpeedLabel.text = currentWeather.getWindSpeed()
        cityLabel.text = currentWeather.getCityName()
        weatherDescriptionLabel.text = currentWeather.getDescription()
    }
}

