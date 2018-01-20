//
//  Constants.swift
//  WeatherApp
//
//  Created by Burhanuddin Shakir on 17/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success : Bool) -> ()


// URL Constants

let BASE_URL = "http://samples.openweathermap.org/data/2.5"
let DYNAMIC_LOCATION_URL = "http://api.openweathermap.org/data/2.5"
let WEATHER_PARAMETERS = "?lat=22.5726&lon=88.3639&appid=khwbacqbjerov"
let FORECAST_PARAMETERS = "?lat=37.785834&lon=62.66&cnt=10&appid=khwbacqbjerov"
let APP_ID = "ab7a26d0ad2e5bd4356c78fdc3eed914"


let CURRENT_WEATHER_URL = "\(BASE_URL)/weather\(WEATHER_PARAMETERS)"
let FORECAST_URL = "\(BASE_URL)/forecast/daily\(FORECAST_PARAMETERS)"

let GOOGLE_API_KEY = "AIzaSyAPt0sahQtfy0ansLIf-UkhmYb0FtVoqwA"

func getTempInDegrees(temp : Double) -> Double{
    let celsius = round((temp - 273.15)*10/10)
    return celsius
}

func getDate(dt:Int) -> String{
    
    let date = Date(timeIntervalSince1970: TimeInterval(dt))
    let todaysDate = Date(timeIntervalSince1970:TimeInterval(NSDate().timeIntervalSince1970))
    
    let dateFormatter = DateFormatter()
    
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
    
    dateFormatter.locale = NSLocale.current
    
    
    dateFormatter.dateFormat = "MMMM d, yyyy" //Specify your format that you want
    
    let strInputDate = dateFormatter.string(from: date)
    let strCurrentDate = dateFormatter.string(from: todaysDate)
    var result = ""
    
    if(strInputDate.elementsEqual(strCurrentDate)){ // Printing Today if todays date is equal to weather date
        result = "Today, \(strInputDate)"
    }
    else{
        dateFormatter.dateFormat = "EEEE, MMMM d, yyyy"
        result = dateFormatter.string(from: date)
    }
    
    return result
}

func getDay(dt:Int) -> String{
    let date = Date(timeIntervalSince1970: TimeInterval(dt))
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "EEEE"
    let strDate = dateFormatter.string(from: date)
    
    return strDate
}
