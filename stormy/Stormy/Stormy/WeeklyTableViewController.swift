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
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }
  
  // MARK: Weather Fetching
  
  func retreiveWeatherForecast() {
    let forecastService = ForecastService(APIKey: forecastAPIKey)
    forecastService.getForecast(coordinate.latitude, longitude: coordinate.longitude) {
      (let currently) in
      
      if let currentWeather = currently {
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
          
          

          
        }
      }
      
    }
  }


  

}
