//
//  ViewController.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/25/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentWeather:Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentWeather = CurrentWeatherCustomCity().getCurrentWeather()
        temperatureLabel.text = String(format:"%.0f",((currentWeather?.temperature)! - 273.15)) + "º"
        cityLabel.text = currentWeather?.cityName
        weatherDescriptionLabel.text = currentWeather?.description
        humidityLabel.text = String(describing: currentWeather!.humidity!) + " %"
        pressureLabel.text = String(describing: currentWeather!.pressure!) + " hPa"
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm"
        sunriseLabel.text = "⬆︎ " + dateformatter.string(from: (currentWeather?.sunrise)!)
        sunsetLabel.text = "⬇︎ " + dateformatter.string(from: (currentWeather?.sunset)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!

}

