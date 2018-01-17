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
    
    func getForecast(completion: @escaping CompletionHandler){
        
        Alamofire.request(FORECAST_URL, method: .get).validate().responseJSON { response in
            switch response.result
            {
            case .success(let value):
                
                let json = JSON(value)
                
                print(json)
                
                if let forecastList = json["list"].array{
                    
                    for item in forecastList{
                        
                        let date = item["dt"].intValue
                        let weather = item["weather"][0]["main"].stringValue
                        let minTemp = item["temp"]["min"].doubleValue
                        let maxTemp = item["temp"]["max"].doubleValue
                        
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
