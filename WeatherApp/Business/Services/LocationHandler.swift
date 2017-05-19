//
//  LocationHandler.swift
//  WeatherApp
//
//  Created by Yevgen Berberyan on 5/19/17.
//  Copyright © 2017 Yevgen Berberyan. All rights reserved.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    var latitude: Double?
    var longtitude: Double?
    
    weak var delegate : CurrentWeatherViewControllerDelegate?
    
    //MARK: singleton instance
    static let sharedInstance : LocationHandler = LocationHandler()
    
    //MARK: initializer
    private override init() {
        super.init()

        locationManager = CLLocationManager()
        let lastLocation = locationManager?.location
//        latitude = lastLocation?.coordinate.latitude
//        longtitude = lastLocation?.coordinate.longitude
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager?.requestWhenInUseAuthorization()
    }
    
    //MARK: get location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if currentLocation == nil {
            currentLocation = locations.first
            locationManager?.stopUpdatingLocation()
        } else {
            guard locations.first != nil else { return }
            latitude = currentLocation?.coordinate.latitude
            longtitude = currentLocation?.coordinate.longitude
            print(latitude!)
            print(longtitude!)
            delegate?.reloadData(msg: "===called from locationManager()===")
        }
    }
    
    //MARK: authorization
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager?.startUpdatingLocation()
        }
    }
    
    //MARK: setup
    func setUp(delegate: CurrentWeatherViewControllerDelegate) {
        self.delegate = delegate
    }
}
