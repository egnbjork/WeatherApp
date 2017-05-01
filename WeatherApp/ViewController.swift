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
        // Do any additional setup after loading the view, typically from a nib.
        let weatherUrl = OpenWeatherURL()
        let weatherHandler = OpenWeatherResponseHandler()
        let weatherParser = WeatherParser().currentWeather
        let currentWeather = weatherHandler.getData(url: weatherUrl, parser: weatherParser)
        print("data capacity in view is \(currentWeather.capacity)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

