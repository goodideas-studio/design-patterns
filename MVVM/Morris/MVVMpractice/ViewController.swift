//
//  ViewController.swift
//  MVVMpractice
//
//  Created by Morris on 2018/3/29.
//  Copyright © 2018年 Morris. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var dayArray = [Item]()
    var monthArray = [Item]()
    var chooseTime = UserDefaults.standard.array(forKey: "section1") as? [Int]
    var ChooseUnit = UserDefaults.standard.array(forKey: "section1") as? [Int]
    var chooseTemp = UserDefaults.standard.array(forKey: "section1") as? [Int]

    let apiAddress = "https://api.darksky.net/forecast/3065d29ac852c3307ee004ff57393dec/23.5406121,119.5017759"
    
    var okTime:Double = 0
    var okIcon:String = ""
    var okTempHigh:Double = 0
    var okTempLow:Double = 0
    var okWind:Double = 0
    var dayIndex = 0
    var daycount = [DailyDetailData]()
    
    
    
    func getdate(unixTime:Double){
        let date = Date(timeIntervalSince1970: unixTime)
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "eeee"
        let dayResult = dayFormatter.string(from: date)
        print(dayResult)
        //設定月份及日期
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM d"
        let monthResult = monthFormatter.string(from: date)
        print(monthResult)
    }


    
    var urlSession = URLSession(configuration: .default)
    
    @IBAction func backToMe(_ segue:UIStoryboardSegue){
        
    }
    func downloadWeatherData(withAddress webAddress:String){
        
        if let url = URL(string: webAddress){
            let task = urlSession.dataTask(with: url, completionHandler: {
                (data, reponse, error) in
                if let loadedData = data{
                    do{
                        let decoder = JSONDecoder()
                        let okData = try decoder.decode(AllData.self, from: loadedData)
                        self.daycount = okData.daily.data
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        print(self.daycount.count)
                        self.okTime = okData.daily.data[self.dayIndex].time
//                        self.okIcon = okData.daily.data[self.dayIndex].icon
//                        self.okTempHigh = okData.daily.data[self.dayIndex].temperatureHigh
//                        self.okTempLow = okData.daily.data[self.dayIndex].temperatureLow
//                        self.okWind = okData.daily.data[self.dayIndex].windSpeed
                    }catch{
                        self.popAlert(withTitle: "Load Data Error")
                    }
                }
            })
            task.resume()
        }
        
    }
    
    func popAlert(withTitle title:String){
        let alert = UIAlertController(title: title, message: "please try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daycount.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? WeatherTableViewCell else { return UITableViewCell() }
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        
        let newDayItem = Item()
        let newMonthItem = Item()
        //設定月份及日期
        
        let date = Date(timeIntervalSince1970: okTime)
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "eeee"
        let dayResult = dayFormatter.string(from: date)
        newDayItem.title = dayResult
        
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "MMMM d"
        let monthResult = monthFormatter.string(from: date)
        newMonthItem.title = monthResult
        dayArray.append(newDayItem)
        monthArray.append(newMonthItem)
    
        okTime += 86400
        
        
        
        
   
        cell.tempLabel.text = "\(daycount[indexPath.row].temperatureLow)ºF - \(daycount[indexPath.row].temperatureHigh)ºF"
//
//            cell.tempLabel.text = "\(Int(((daycount[indexPath.row].temperatureLow)-32) * 5/9))ºC - \(Int(((daycount[indexPath.row].temperatureLow)-32) * 5/9))ºC"
        cell.windSpeedLabel.text = "\(daycount[indexPath.row].windSpeed)KPH"
        cell.dayLabel.text = dayArray[indexPath.row].title
        cell.dateLabel.text = monthArray[indexPath.row].title
        
        
        
        
//        if indexPath == [0,0]{
//            dayIndex = 0
//            cell.tempLabel.text = "\(okTempLow)ºF - \(okTempHigh)ºF"
//            cell.dayLabel.text = dayResult
//            cell.dateLabel.text = monthResult
//            cell.windSpeedLabel.text = "\(okWind)KPH"
//
//        }
//        if indexPath == [1,0]{
//            dayIndex = 1
//
//            cell.tempLabel.text = "\(okTempLow)ºF - \(okTempHigh)ºF"
//            cell.dayLabel.text = dayResult
//            cell.dateLabel.text = monthResult
//            cell.windSpeedLabel.text = "\(okWind)KPH"
//        }
//        if indexPath == [2,0]{
//            dayIndex = 2
//
//            cell.tempLabel.text = "\(okTempLow)ºF - \(okTempHigh)ºF"
//            cell.dayLabel.text = dayResult
//            cell.dateLabel.text = monthResult
//            cell.windSpeedLabel.text = "\(okWind)KPH"
//        }
//        if indexPath == [3,0]{
//            dayIndex = 3
//
//            cell.tempLabel.text = "\(okTempLow)ºF - \(okTempHigh)ºF"
//            cell.dayLabel.text = dayResult
//            cell.dateLabel.text = monthResult
//            cell.windSpeedLabel.text = "\(okWind)KPH"
//        }
//        if indexPath == [4,0]{
//            dayIndex = 4
//
//            cell.tempLabel.text = "\(okTempLow)ºF - \(okTempHigh)ºF"
//            cell.dayLabel.text = dayResult
//            cell.dateLabel.text = monthResult
//            cell.windSpeedLabel.text = "\(okWind)KPH"
//        }
//        if indexPath == [5,0]{
//            dayIndex = 5
//
//            cell.tempLabel.text = "\(okTempLow)ºF - \(okTempHigh)ºF"
//            cell.dayLabel.text = dayResult
//            cell.dateLabel.text = monthResult
//            cell.windSpeedLabel.text = "\(okWind)KPH"
//        }
//        if indexPath == [6,0]{
//            dayIndex = 6
//
//            cell.tempLabel.text = "\(okTempLow)ºF - \(okTempHigh)ºF"
//            cell.dayLabel.text = dayResult
//            cell.dateLabel.text = monthResult
//            cell.windSpeedLabel.text = "\(okWind)KPH"
//        }
//        if indexPath == [7,0]{
//            dayIndex = 7
//
//            cell.tempLabel.text = "\(okTempLow)ºF - \(okTempHigh)ºF"
//            cell.dayLabel.text = dayResult
//            cell.dateLabel.text = monthResult
//            cell.windSpeedLabel.text = "\(okWind)KPH"
//        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? CGFloat(80.0) : CGFloat(42.0)
    }
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadWeatherData(withAddress: apiAddress)
        

        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

