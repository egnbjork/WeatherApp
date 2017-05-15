//
//  ViewController.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/25/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentCityWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let path = Bundle.main.path(forResource: "city.list", ofType: "json")
//        let data = NSData.init(contentsOfFile: path!)
//        print(data)
        updateCurrentWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCurrentWeather() {
        if let currentWeather = currentCityWeather.getCurrentWeather() {
            if let temperature = currentWeather.temperature?.converted(to: UnitTemperature.celsius).value {
                temperatureLabel.text = String(format:"%.0f", temperature) + "º"
            }
            if let humidity = currentWeather.humidity {
                humidityLabel.text = String(describing: humidity) + " %"
            }
            if let pressure = currentWeather.pressure {
                pressureLabel.text = String(describing: pressure) + " hPa"
            }
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "HH:mm"
            if let sunrise = currentWeather.sunrise {
                sunriseLabel.text = "⬆︎ " + dateformatter.string(from: sunrise)
            }
            if let sunset = currentWeather.sunset {
                sunsetLabel.text = "⬇︎ " + dateformatter.string(from: sunset)
            }
            if let windSpeed = currentWeather.wind.speed?.converted(to: UnitSpeed.knots).value {
                windSpeedLabel.text = (String(format:"%.0f", windSpeed)) + " kn"
            }
            cityLabel.text = currentWeather.cityName
            weatherDescriptionLabel.text = currentWeather.description
            }
    }
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
}

