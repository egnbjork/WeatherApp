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
        print("today is \((currentWeather?.temperature!)! - 273.15) ºC")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

