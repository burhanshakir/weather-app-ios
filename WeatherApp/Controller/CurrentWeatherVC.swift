//
//  CurrentWeatherVC.swift
//  WeatherApp
//
//  Created by Burhanuddin Shakir on 15/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import UIKit


class CurrentWeatherVC: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var forecastTable: UITableView!
    
    let currentWeatherService = CurrentWeatherService.instance
    let forecastService = ForecastWeatherService.instance
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        forecastTable.dataSource = self
        forecastTable.delegate = self
        forecastTable.rowHeight = 150.0
        
        currentWeatherService.getCurrentWeather{(success) in
            
            let currentWeather = CurrentWeatherService.instance.currentWeather
            
            self.updateViews(currentWeather: currentWeather)
        }
        
        
        forecastService.getForecast { (success) in
            self.forecastTable.reloadData()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastService.forecasts.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let forecastCell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell") as? ForecastCell
        {
            
            let forecast = forecastService.forecasts[indexPath.row]
            
            forecastCell.updateViews(forecast: forecast)
            
            return forecastCell
        }
        else
        {
            return ForecastCell()
        }
    }
    
    func updateViews(currentWeather : CurrentWeather){
        
        self.dateLabel.text = getDate(dt:currentWeather.date)
        
        self.tempLabel.text = String(getTempInDegrees(temp: currentWeather.temperature))
        
        self.cityLabel.text = currentWeather.city
        self.weatherLabel.text = currentWeather.weather
        self.weatherImage.image = UIImage(named: currentWeather.weather)
        
        
    }
   
}
