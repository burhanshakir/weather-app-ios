//
//  Forecast.swift
//  WeatherApp
//
//  Created by Burhanuddin Shakir on 17/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import Foundation

struct Forecast{
    public private(set) var date: Int!
    public private(set) var minTemperature: Double!
    public private(set) var maxTemperature: Double!
    public private(set) var weather: String!
    public private(set) var description: String!
    public private(set) var pressure: Double!
    public private(set) var humidity: Double!
    public private(set) var wind: Double!
    public private(set) var city: String!
}
