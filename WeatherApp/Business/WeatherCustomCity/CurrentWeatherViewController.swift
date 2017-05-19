//
//  ViewController.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/25/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import UIKit
import SwiftyJSON
import CoreLocation

class CurrentWeatherViewController: UIViewController {
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    var location: LocationHandler?

    //MARK: Controller methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData(msg: "===called from viewDidLoad()===")
        location = LocationHandler.sharedInstance
        location?.setUp(delegate: self)

        if let city = CityHandler().getCity(cityName: "Odessa", countryCode: "UA") {
            let currentWeather = CurrentWeather(city: city)
            updateCurrentWeatherLabels(currentWeather: currentWeather)
            print(city.name ?? "Not available")
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

protocol CurrentWeatherViewControllerDelegate: class {
    func reloadData(msg: String)
}

extension CurrentWeatherViewController: CurrentWeatherViewControllerDelegate {
    func reloadData(msg: String) {
        print("latitude is \(String(describing: location?.latitude))")
        print("longtitude is \(String(describing: location?.longtitude))")
        print(msg)
        if location?.latitude != nil && location?.longtitude != nil {
            if let city = CityHandler().getCity(latitude: (location?.latitude)!, longtitude: (location?.longtitude)!) {
                    print(city.name!)
            }
        }
    }
}
