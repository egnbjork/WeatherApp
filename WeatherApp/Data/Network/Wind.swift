//
//  Wind.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

public class Wind {
    var direction: Int?
    var speed:Measurement<UnitSpeed>?
    
    func setSpeed(speed: Double?) {
        if speed != nil {
            self.speed = Measurement(value:speed!, unit: UnitSpeed.metersPerSecond)
        }
    }
}
