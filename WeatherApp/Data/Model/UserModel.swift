//
//  UserModel.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 4/26/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation

public class UserModel {
    var login: String
    var password: String
    var cities: [City]?
    var settings: SettingsModel
    
    init (user: User, settings: SettingsModel) {
        self.login = user.login
        self.password = user.password
        self.settings = settings
    }
}
