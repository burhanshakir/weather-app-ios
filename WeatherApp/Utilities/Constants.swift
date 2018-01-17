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
let PARAMETERS = "?lat=37.785834&lon=62.66&appid=khwbacqbjerov"

let CURRENT_WEATHER_URL = "\(BASE_URL)/weather\(PARAMETERS)"
let FORECAST_URL = "\(BASE_URL)/forecast\(PARAMETERS)"
