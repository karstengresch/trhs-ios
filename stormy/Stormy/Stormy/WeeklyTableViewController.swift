//
//  WeeklyTableViewController.swift
//  Stormy
//
//  Created by Karsten Gresch on 05.09.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import UIKit

class WeeklyTableViewController: UITableViewController {
  @IBOutlet weak var currentTemperatureLabel: UILabel?
  @IBOutlet weak var currentWeatherIcon: UIImageView?
  @IBOutlet weak var currentPrecipitationLabel: UILabel?
  @IBOutlet weak var currentTemperatureRangeLabel: UILabel?
  
  private let forecastAPIKey = "830b7f5b95cc1d9c4c511ba42ffb6eb5"
  let coordinate: (latitude: Double, longitude: Double) = (37.8267,-122.423)

  var weeklyWeather: [DailyWeather] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()
      configureView()
      retreiveWeatherForecast()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func configureView() {
    tableView.backgroundView = BackgroundView()
    
    // custom height for table view row 
    tableView.rowHeight = 64

    if let navBarFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
      let navBarAttributesDictionary: [NSObject: AnyObject]? = [
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: navBarFont
      ]
      navigationController?.navigationBar.titleTextAttributes = navBarAttributesDictionary
    }

  }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Forecast"
  }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return weeklyWeather.count
    }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("WeatherCell") as! DailyWeatherTableViewCell
    
    let dailyWeather = weeklyWeather[indexPath.row]
    if let maxTemperature = dailyWeather.maxTemperature {
      cell.temperatureLabel.text = "\(maxTemperature)°"
    }
    
    cell.weatherIcon.image = dailyWeather.icon
    
    cell.dayLabel.text = dailyWeather.day
    
    return cell
  }
  
  // MARK: Delegate Methods
  
  override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    view.tintColor = UIColor(red: 61.9/255.0, green: 96.5/255.0, blue: 185.9/255.0, alpha: 1.0)
    
    if let header = view as? UITableViewHeaderFooterView {
      header.textLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 14.0)
      header.textLabel.textColor = UIColor.whiteColor()
      
    }
  }
  
  override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
    var cell = tableView.cellForRowAtIndexPath(indexPath)
    cell?.contentView.backgroundColor = UIColor(red: 47.7/255.0, green: 73.6/255.0, blue: 171.4/255.0, alpha: 0.77)
    let highlightView = UIView()
    highlightView.backgroundColor = UIColor(red: 47.7/255.0, green: 73.6/255.0, blue: 171.4/255.0, alpha: 0.77)
    cell?.selectedBackgroundView = highlightView
  }
  
  // MARK: Weather Fetching
  
  func retreiveWeatherForecast() {
    let forecastService = ForecastService(APIKey: forecastAPIKey)
    forecastService.getForecast(coordinate.latitude, longitude: coordinate.longitude) {
      (let forecast) in
      
      if let weatherForecast = forecast,
      let currentWeather = weatherForecast.currentWeather {
        dispatch_async(dispatch_get_main_queue()) {
          
          if let temperature = currentWeather.temperature {
            self.currentTemperatureLabel?.text = "\(temperature)°"
          }
          
          
          if let precipitation = currentWeather.precipProbability {
            self.currentPrecipitationLabel?.text = "Rain: \(precipitation)%"
          }
          
          if let icon = currentWeather.icon {
            self.currentWeatherIcon?.image = icon
          }
          
          
          self.weeklyWeather = weatherForecast.weekly
          
          if let highTemperature = self.weeklyWeather.first?.maxTemperature, let lowTemperature = self.weeklyWeather.first?.minTemperature {
            self.currentTemperatureRangeLabel?.text = "↑\(highTemperature)° ↓\(lowTemperature)°"
          }
          
          self.tableView.reloadData()
          
        }
      }
      
    }
  }


  

}
