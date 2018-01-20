//
//  CurrentWeatherService.swift
//  WeatherApp
//
//  Created by Burhanuddin Shakir on 17/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrentWeatherService{
    
    
    static let instance = CurrentWeatherService()
    
    var currentWeather = CurrentWeather()
    
    func getCurrentWeather(url:String!, completion : @escaping CompletionHandler)
    {
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result
            {
            case .success(let value):
                
                let json = JSON(value)
                
                let city = json["name"].stringValue
                let date = json["dt"].intValue
                let weather = json["weather"][0]["main"].stringValue
                let temperature = json["main"]["temp"].doubleValue
                
                let currentWeather = CurrentWeather(date: date, city: city, temperature: temperature, weather: weather)
                
                self.currentWeather = currentWeather
                
                completion(true)
                
                
                
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
        
        
    }
   
    
}
