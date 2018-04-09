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
    //定義array的型態
    var dayArray = [Item]()
    var monthArray = [Item]()


    let apiAddress = "https://api.darksky.net/forecast/3065d29ac852c3307ee004ff57393dec/23.5406121,119.5017759"
    
    var okTime:Double = 0

    var dayIndex = 0
    //daycount為array, 裡面存了daily第0-7天的index
    var daycount = [DailyDetailData]()


    
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
                        self.okTime = okData.daily.data[self.dayIndex].time
                    }catch{
                        self.popAlert(withTitle: "Load Data Error")
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
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
        //每執行一次就會增加至陣列一次
        //共執行8次
        dayArray.append(newDayItem)
        monthArray.append(newMonthItem)
        //unix time 一天的秒數
        okTime += 86400
        //userDefaults放此才會每次重讀取最新的選擇
        var chooseTime = UserDefaults.standard.array(forKey: "section1") as? [Int] ?? [0,1]
        var chooseUnit = UserDefaults.standard.array(forKey: "section2") as? [Int] ?? [1,1]
        var chooseTemp = UserDefaults.standard.array(forKey: "section3") as? [Int] ?? [2,1]
        
        //row 0 is ºF
        if chooseTemp[1] == 0{
            cell.tempLabel.text = "\(daycount[indexPath.row].temperatureLow)ºF - \(daycount[indexPath.row].temperatureHigh)ºF"
        //row 0 is ºC
        }else if chooseTemp[1] == 1{
            cell.tempLabel.text = "\(Int(((daycount[indexPath.row].temperatureLow)-32) * 5/9))ºC - \(Int(((daycount[indexPath.row].temperatureLow)-32) * 5/9))ºC"
            
        }
        //row 0 is MPH
        if chooseUnit[1] == 0{
            cell.windSpeedLabel.text = "\(Float(daycount[indexPath.row].windSpeed / 1.6))MPH"
        //row 1 is KPH
        }else if chooseUnit[1] == 1{
            cell.windSpeedLabel.text = "\(daycount[indexPath.row].windSpeed)KPH"
        }
        
        
        cell.dayLabel.text = dayArray[indexPath.row].title
        cell.dateLabel.text = monthArray[indexPath.row].title
        cell.iconImage.image = UIImage(named:daycount[indexPath.row].icon)
    
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
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        downloadWeatherData(withAddress: apiAddress)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

