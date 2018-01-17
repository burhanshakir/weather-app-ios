//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Burhanuddin Shakir on 17/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import Foundation

struct CurrentWeatherResponse{
    public private(set) var date: Int!
    public private(set) var city: String!
    public private(set) var weather: Weather!
    public private(set) var temperature: CurrentWeatherMain!
    
}
