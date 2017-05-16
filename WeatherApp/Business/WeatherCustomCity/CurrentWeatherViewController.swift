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
        updateCurrentWeatherLabels()

        DispatchQueue.global().async {
        let cityHandler = CityHandler()
        var json = cityHandler.readCityJson()
        let cityName:JSON = "Odessa"
        let country:JSON = "UA"
        json.filter{(_, entry) in entry["name"] == cityName && entry["country"] == country}
            .map{(_, entry) -> Void in print(entry) }
        }
    }

    //TODO:
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: helper methods
    private func updateCurrentWeatherLabels() {
        let currentWeather = CurrentWeather()
        
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

