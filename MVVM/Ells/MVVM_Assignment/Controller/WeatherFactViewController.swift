//  WeatherFactViewController.swift
//  MVVM_Assignment
//
//  Created by 唐嘉伶 on 02/04/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class WeatherFactViewController: UITableViewController, CLLocationManagerDelegate {

  let locationManager = CLLocationManager()

  var weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
  var weatherResults = "somedata"
    override func viewDidLoad() {
      super.viewDidLoad()
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
      locationManager.requestAlwaysAuthorization()
      locationManager.startUpdatingLocation()
      
      getWeather(url: darkSkyAPIKey)
      
      var jsonData = JSON(getWeather(url: darkSkyAPIKey))
      
    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return weekdays.count
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! WeatherFactCell
    //cell.temperatureLabel
    
    return cell
  }
  
  
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    let location = locations[locations.count - 1]
    
    if location.horizontalAccuracy > 0 {
      locationManager.stopUpdatingLocation()
      print("latitude is: \(location.coordinate.latitude), longitude is: \(location.coordinate.longitude)")
      let lat = location.coordinate.latitude
      let long = location.coordinate.longitude
      let latitude = String(format: "%.4f", lat)
      let longtitude = String(format: "%.4f", long)
      
      location_API_Suffix = "\(latitude)," + "\(longtitude)"
      darkSkyAPIKey = "\(darkSkyAPI_Prefix)" + "\(location_API_Suffix)"
      print(darkSkyAPIKey)
    }
  }
 
}



