//
//  APIManager.swift
//  MVVM
//
//  Created by EthanLin on 2018/4/3.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation

class APIManager{
    
    static let shared = APIManager()
    
    func fetchWeatherData(url:String, completion: @escaping (WeatherData?)->Void){
        let url = URL(string: url)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            if let data = data{
                do{
                    let jsonDecoder = JSONDecoder()
                    let downloadedWeatherData = try jsonDecoder.decode(WeatherData.self, from: data)
                    completion(downloadedWeatherData)
                }catch{
                    dump(error.localizedDescription)
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}
