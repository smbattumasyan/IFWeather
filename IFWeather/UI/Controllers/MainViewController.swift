//
//  ViewController.swift
//  IFWeather
//
//  Created by ՍՄԲԱՏ ԹՈՒՄԱՍՅԱՆ on 15.07.21.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var barometerLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private Properties
    private var locationManager = CLLocationManager()
    private var currentWeatherViewModel: CurrentWeatherViewModel?
    private var dailyWeatherViewModel: DailyWeatherViewModel?
    private var dayViewModel: DayViewModel?
    
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

    // MARK: - Life Cyrcle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentWeatherViewModel = CurrentWeatherViewModel()
        currentWeatherViewModel?.delegate = self
        dailyWeatherViewModel = DailyWeatherViewModel()
        dailyWeatherViewModel?.delegate = self
        dayViewModel = DayViewModel()
        setupLocation()
    }
    
    
    // MARK: - Private Methods
    private func setupLocation() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.requestWhenInUseAuthorization()
    }
    
    private func setupWeather(_ weather: Weather) {
        let weatherViewModel = WeatherViewModel()
        let intput = WeatherViewModel.Input(weather: weather)
        let output = weatherViewModel.transform(intput)
        weatherStatusLabel.text = output.main
    }

    private func setupMainWeather(_ weather: MainWeather) {
        let mainWeatherViewModel = MainWeatherViewModel()
        let input = MainWeatherViewModel.Input(weather: weather)
        let output = mainWeatherViewModel.transform(input)
        tempLabel.text = output.temp
        humidityLabel.text = output.humidity
        barometerLabel.text = output.pressure
    }
    
    private func setupWind(_ wind: Wind) {
        let windViewModel = WindViewModel()
        let input = WindViewModel.Input(wind: wind)
        let output = windViewModel.transform(input)
        windLabel.text = output.speed
    }
    
    func dayViewModel(at indexPath: IndexPath) -> DayViewModel.Output? {
        if let dayModel = dailyWeatherViewModel?.dailyWeather?.days[indexPath.row] {
            let input = DayViewModel.Input(day: dayModel)
            return dayViewModel?.transform(input)
        }
        return nil
    }
}

// MARK: - CLLocationManagerDelegate
extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("Location: \(location)")
        currentWeatherViewModel?.requestWeather(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        manager.stopUpdatingLocation()
        dailyWeatherViewModel?.requestWeather(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .restricted, .notDetermined:
            break
        case .denied:
            let alertController = UIAlertController.createSettingsAlertController(title: "Location Settings", message: "Allow access to your loction, for show current weather.")
            self.present(alertController, animated: true, completion: nil)
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

// MARK: - CurrentWeatherViewModelDelegate
extension MainViewController: CurrentWeatherViewModelDelegate {
    func parseCurrentWeatherSuccess(_ currentWeather: CurrentWeather) {
        addressLabel.text = currentWeather.name
        
        setupMainWeather(currentWeather.main)
        setupWind(currentWeather.wind)
        if let weather = currentWeather.weather.first {
            setupWeather(weather)
        }
    }
    
    func parseCurrentWeatherWithMessage(_ message: String) {
        showAlert("Error", message: message)
    }
}

// MARK: - DailyWeatherViewModelDelegate
extension MainViewController: DailyWeatherViewModelDelegate {
    func parseDailyWeatherSuccess() {
        tableView.reloadData()
    }
    
    func parseDailyWeatherWithMessage(_ message: String) {
        showAlert("Error", message: message)
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyWeatherViewModel?.dailyWeather?.days.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DayTableViewCell.id, for: indexPath) as! DayTableViewCell
        cell.setupCell(dayViewModel(at: indexPath))
        return cell
    }
}
