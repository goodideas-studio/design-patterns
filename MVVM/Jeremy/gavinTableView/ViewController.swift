//
//  ViewController.swift
//  gavinTableView
//
//  Created by JeremyXue on 2018/3/29.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var weekArray = [String]()
    
    var windSpeed = [Int]()
    var temperatureLow = [Int]()
    var temperatureHigh = [Int]()
    
    var temperatureFLow = [Int]()
    var temperatureFHigh = [Int]()
    
    var icon = [String]()
    var time = [String]()
    
    var saveArray = UserDefaults.standard.array(forKey: "sectionSelected") as! [Int]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return time.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        
        
        cell.weekLabel.text = weekArray[indexPath.row]
        cell.windSpeedLabel.text = "\(windSpeed[indexPath.row]) KPH"
        cell.timeLabel.text = "\(time[indexPath.row])"
        
        if saveArray[2] == 0 {
            cell.temperatureLabel.text = "\(temperatureLow[indexPath.row]) °C - \(temperatureHigh[indexPath.row]) °C"
        } else {
            cell.temperatureLabel.text = "\(temperatureFLow[indexPath.row]) °F - \(temperatureFHigh[indexPath.row]) °F"
        }
        
        
        return cell
    }
    
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        
        
        
        let url = URL(string: "https://api.darksky.net/forecast/f5c57a3e20732c5b22224ab24ddad959/37.8267,-122.4233")!
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            
            decoder.dateDecodingStrategy = .secondsSince1970
            
            
            if let data = data, let weatherList = try? decoder.decode(WeatherModel.self, from: data) {
                
                for data in weatherList.daily.data {
                    
                    
                    dateFormatter.dateFormat = "MMMM dd"
                    let dateString = dateFormatter.string(from: data.time)
                    self.time.append(dateString)
                    
                    dateFormatter.dateFormat = "EEEE"
                    let weekString = dateFormatter.string(from: data.time)
                    self.weekArray.append(weekString)
                    
                    self.windSpeed.append(Int(data.windSpeed))
                    self.temperatureLow.append(Int(data.temperatureLow))
                    self.temperatureHigh.append(Int(data.temperatureHigh))
                    self.temperatureFLow.append(Int((data.temperatureLow + 40) * 1.8 - 40))
                    self.temperatureFHigh.append(Int((data.temperatureHigh + 40) * 1.8 - 40))
                }
                DispatchQueue.main.async {
                    self.weatherTableView.reloadData()
                }
                

            } else {
                print(error)
            }
        }
        task.resume()
        weatherTableView.reloadData()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        saveArray = UserDefaults.standard.array(forKey: "sectionSelected") as! [Int]
        weatherTableView.reloadData()
    }
    
//    func temperatureCtoF() {
//        for c in 0..<temperatureLow.count {
//            temperatureFLow.append((temperatureLow[c] + 40) * 1.8 - 40)
//        }
//        for c in 0..<temperatureHigh.count {
//            temperatureFHigh.append((temperatureHigh[c] + 40) * 1.8 - 40)
//        }
//    }
    
//    func temperatureFtoC() {
//        for f in 0..<temperatureLow.count {
//            temperatureLow[f] = Double((f - 32) * 5 / 9)
//        }
//        for f in 0..<temperatureHigh.count {
//            temperatureHigh[f] = Double((f - 32) * 5 / 9)
//        }
//    }

}

