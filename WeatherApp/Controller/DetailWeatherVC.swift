//
//  DetailWeatherVC.swift
//  WeatherApp
//
//  Created by Burhanuddin Shakir on 20/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import UIKit

class DetailWeatherVC: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    @IBOutlet weak var humidityLable: UILabel!
    
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    
    @IBOutlet weak var windLabel: UILabel!
    
    public var forecast: Forecast!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        updateViews()
    }
    
    func updateViews(){
        
        cityLabel.text = forecast.city
        dateLabel.text = getDate(dt: forecast.date)
        descriptionLabel.text = forecast.description
        weatherImage.image = UIImage(named: forecast.weather)
        temperatureLabel.text = "\(String(getTempInDegrees(temp: forecast.minTemperature))) C"
        humidityLable.text = "\(String(forecast.humidity))%"
        pressureLabel.text = "\(String(forecast.pressure))hPa"
        windLabel.text = "\(String(forecast.wind * 3.6))Kmh"
        
    }
}
    


