//
//  CurrentWeatherVC.swift
//  WeatherApp
//
//  Created by Burhanuddin Shakir on 15/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import UIKit


class CurrentWeatherVC: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var forecastTable: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let currentWeatherService = CurrentWeatherService.instance
        let forecastService = ForecastWeatherService.instance
        
        currentWeatherService.getCurrentWeather{(success) in
            
            let currentWeather = CurrentWeatherService.instance.currentWeather
            
            self.dateLabel.text = String(currentWeather.date)
            self.tempLabel.text = String(currentWeather.temperature)
            self.cityLabel.text = currentWeather.city
            self.weatherLabel.text = currentWeather.weather
            self.weatherImage.image = UIImage(named: currentWeather.weather)
        }
        
        forecastService.getForecast { (success) in
            
        }
    }
    
    
    
    

}
