//
//  ForecastWeatherService.swift
//  WeatherApp
//
//  Created by Burhanuddin Shakir on 17/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ForecastWeatherService{
    
    static let instance = ForecastWeatherService()
    
    var forecasts = [Forecast]()
    
    func getForecast(url : String!, completion: @escaping CompletionHandler){
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result
            {
            case .success(let value):
                
                self.forecasts.removeAll()
                
                let json = JSON(value)
                                            
                if let forecastList = json["list"].array{
                    
                    for item in forecastList{
                        
                        let date = item["dt"].intValue
                        let weather = item["weather"][0]["main"].stringValue
                        var minTemp = 0.0
                        var maxTemp = 0.0
                        
                        if item["temp"].count > 0{
                            minTemp = item["temp"]["min"].doubleValue
                            maxTemp = item["temp"]["max"].doubleValue
                        }
                        else{
                            minTemp = item["main"]["temp_min"].doubleValue
                            maxTemp = item["main"]["temp_max"].doubleValue
                        }
                        
                        
                        let forecast = Forecast(date: date, minTemperature: minTemp, maxTemperature: maxTemp, weather: weather)
                        
                        self.forecasts.append(forecast)
                    }
                }
               
                completion(true)
                
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
        
    }
}
