//
//  ForecastCell.swift
//  WeatherApp
//
//  Created by Burhanuddin Shakir on 17/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!

    func updateViews(forecast: Forecast)
    {
        let weather = forecast.weather ?? "Clear"
        weatherImage.image = UIImage(named: weather)
        weatherLabel.text = forecast.weather ?? "Clear"
        minTempLabel.text = String(getTempInDegrees(temp: forecast.minTemperature))
        maxTempLabel.text = String(getTempInDegrees(temp: forecast.maxTemperature))
        dayLabel.text = getDay(dt: forecast.date)
    }

}
