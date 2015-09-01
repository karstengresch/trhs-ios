//
//  ViewController.swift
//  Stormy
//
//  Created by Karsten Gresch on 28.08.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var currentTemperatureLabel: UILabel?
  @IBOutlet weak var currentHumidityLabel: UILabel?
  @IBOutlet weak var currentPrecipitationLabel: UILabel?
  
  let coordinate: (latitude: Double, longitude: Double) = (37.8267,-122.423)

  private let forecastAPIKey = "830b7f5b95cc1d9c4c511ba42ffb6eb5"


  override func viewDidLoad() {
    super.viewDidLoad()
    
    let forecastService = ForecastService(APIKey: forecastAPIKey)
    forecastService.getForecast(coordinate.latitude, longitude: coordinate.longitude) {
      (let currently) in

      if let currentWeather = currently {
        dispatch_async(dispatch_get_main_queue()) {
          
          if let temperature = currentWeather.temperature {
            self.currentTemperatureLabel?.text = "\(temperature)°"
          }
          
          if let humidity = currentWeather.humidity {
            self.currentHumidityLabel?.text = "\(humidity)%"
          }
          
          if let precipitation = currentWeather.precipProbability {
            self.currentPrecipitationLabel?.text = "\(precipitation)"
          }
          
        }
      }
      
    }
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func getCrazy() {
    if  let plistPath = NSBundle.mainBundle().pathForResource("CrazyInformation", ofType: "plist"),
      let crazyInformation = NSDictionary(contentsOfFile: plistPath)
    {
      // do something
    }
  }


}

