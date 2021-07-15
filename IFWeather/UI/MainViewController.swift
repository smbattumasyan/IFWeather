//
//  ViewController.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 15.07.21.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    private var locationManager = CLLocationManager()
    var viewModel: CurrentWeatherViewModel?
    
    private var locationAuthorizationStatus:  CLAuthorizationStatus {
        get {
            let locationManager = CLLocationManager()
            var locationAuthorizationStatus : CLAuthorizationStatus
            if #available(iOS 14.0, *) {
                locationAuthorizationStatus =  locationManager.authorizationStatus
            } else {
                locationAuthorizationStatus = CLLocationManager.authorizationStatus()
            }
            return locationAuthorizationStatus
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CurrentWeatherViewModel()
        setupLocation()
    }
    
    func setupLocation() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled()
        {
            switch locationAuthorizationStatus {
            
            case .authorizedAlways, .authorizedWhenInUse:
                
                print("Authorize.")
                
                break
                
            case .notDetermined:
                
                print("Not determined.")
                
                
            case .restricted:
                
                print("Restricted.")
                
                
            case .denied:
                
                print("Denied.")
            @unknown default:
                break
            }
        }
        
    }

}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        viewModel?.requestWeather(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted, .denied, .notDetermined:
            break
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        print("Error: \(error)")
    }
}
