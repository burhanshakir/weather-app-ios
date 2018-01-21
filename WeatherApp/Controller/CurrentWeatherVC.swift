//
//  CurrentWeatherVC.swift
//  WeatherApp
//
//  Created by Burhanuddin Shakir on 15/01/18.
//  Copyright © 2018 Burhanuddin Shakir. All rights reserved.
//

import UIKit
import GooglePlaces

class CurrentWeatherVC: UIViewController,UITableViewDataSource, UITableViewDelegate, GMSAutocompleteResultsViewControllerDelegate {
   
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var forecastTable: UITableView!
    
    let currentWeatherService = CurrentWeatherService.instance
    let forecastService = ForecastWeatherService.instance
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    
    var weatherURL = CURRENT_WEATHER_URL
    var forecastURL = FORECAST_URL
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        initGooglePlacesSearch()
        
        
        forecastTable.dataSource = self
        forecastTable.delegate = self
        forecastTable.rowHeight = 150.0
        
        getData(weatherURL : weatherURL, forecastURL : forecastURL)
    
    }
    
    // Service functions
    func getData(weatherURL : String, forecastURL : String ){
        currentWeatherService.getCurrentWeather(url: weatherURL){(success) in
            
            let currentWeather = CurrentWeatherService.instance.currentWeather
            
            self.updateViews(currentWeather: currentWeather)
        }
        
        
        forecastService.getForecast(url: forecastURL) { (success) in
            self.forecastTable.reloadData()
        }
    }
    
    func updateViews(currentWeather : CurrentWeather){
        
        
        self.dateLabel.text = getDate(dt:currentWeather.date)
        
        self.tempLabel.text = String(getTempInDegrees(temp: currentWeather.temperature))
        
        self.cityLabel.text = currentWeather.city
        self.weatherLabel.text = currentWeather.weather
        self.weatherImage.image = UIImage(named: currentWeather.weather) ?? UIImage(named: "Partially Cloudy")
        
        
    }
    
    // Table View Functions
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let forecast = ForecastWeatherService.instance.forecasts[indexPath.row]
        
        performSegue(withIdentifier: "DetailWeatherVC", sender: forecast)
    }
    
    // Google Places
    func initGooglePlacesSearch(){
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        let filter = GMSAutocompleteFilter()
        filter.type = .city
        
        let subView = UIView(frame: CGRect(x: 0, y: 30.0, width: 350.0, height: 45.0))
        
        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false
        
        definesPresentationContext = true
    }
   
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        
        searchController?.isActive = false
        
        let lat = place.coordinate.latitude
        let lon = place.coordinate.longitude
                
        weatherURL = "\(DYNAMIC_LOCATION_URL)/weather?lat=\(lat)&lon=\(lon)&appid=\(APP_ID)"
        forecastURL = "\(DYNAMIC_LOCATION_URL)/forecast?lat=\(lat)&lon=\(lon)&cnt=10&appid=\(APP_ID)"
        
        getData(weatherURL: weatherURL, forecastURL: forecastURL)
        
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
  
    // Segue functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailWeatherVC = segue.destination as? DetailWeatherVC{
            detailWeatherVC.forecast = sender as! Forecast
        }
    }
    
    @IBAction func unwindFromDetailWeatherVC(unwindsegue: UIStoryboardSegue){
        
    }
    
}
