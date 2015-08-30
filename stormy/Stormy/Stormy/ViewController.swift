//
//  ViewController.swift
//  Stormy
//
//  Created by Karsten Gresch on 28.08.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private let forecastAPIKey = "830b7f5b95cc1d9c4c511ba42ffb6eb5"
  

  
  
  @IBOutlet weak var currentTemperatureLabel: UILabel?
    @IBOutlet weak var currentHumidityLabel: UILabel?
    @IBOutlet weak var currentPrecipitationLabel: UILabel?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let baseUrl = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)")
    let forecastUrl = NSURL(string: "37.8267,-122.423", relativeToURL: baseUrl)
    
    if  let plistPath = NSBundle.mainBundle().pathForResource("CurrentWeather", ofType: "plist"),
      let mainWeather = NSDictionary(contentsOfFile: plistPath),
      let currentWeatherDictionary = mainWeather["currently"] as? [String: AnyObject]
      {
        println(plistPath)
        
        let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
        
        currentTemperatureLabel?.text = "\(currentWeather.temperature)°"
        currentHumidityLabel?.text = "\(currentWeather.humidity)%"
        currentPrecipitationLabel?.text = "\(currentWeather.precipProbability)%"
        
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

