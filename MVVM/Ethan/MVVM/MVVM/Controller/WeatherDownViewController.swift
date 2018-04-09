//
//  WeatherDownViewController.swift
//  MVVM
//
//  Created by EthanLin on 2018/4/3.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherDownViewController: UIViewController, CLLocationManagerDelegate {
    
    var weatherData: WeatherData?
    
    @IBOutlet weak var tableView: UITableView!
    
    let fixedURLString = "https://api.darksky.net/forecast/5244b19e0aee34b8bb5ae128befe78f8/37.8267,-122.4233"
    
    var urlString:String?
    
    var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self

        //得到座標
        if let coordinate = locationManager?.location?.coordinate{
            self.urlString = "https://api.darksky.net/forecast/5244b19e0aee34b8bb5ae128befe78f8/\(coordinate.latitude),\(coordinate.longitude)"
            print(urlString)
            print(coordinate.latitude)
            print(coordinate.longitude)
        }

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
            APIManager.shared.fetchWeatherData(url: fixedURLString) { (weatherData) in
                self.weatherData = weatherData
                print(weatherData?.daily.data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension WeatherDownViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let numberOfData = self.weatherData?.daily.data.count{
            return numberOfData
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        cell.updateUI(index: indexPath, model: weatherData!)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height * (100/452)
    }
    
}
