//
//  ForecastService.swift
//  Stormy
//
//  Created by Karsten Gresch on 01.09.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import Foundation

struct ForecastService {
  let forecastAPIKey: String
  let forecastURL: NSURL?
  
  init (APIKey: String) {
    self.forecastAPIKey = APIKey
    forecastURL = NSURL(string: "https://api.forecast.io/\(forecastAPIKey)")
    
  }
  
  
  func getForecast(latitude: Double, longitude: Double, completion: (CurrentWeather? -> Void)) {
    if let forecastURL = NSURL(string: "\(latitude), \(longitude)", relativeToURL: self.forecastURL) {
      
      let networkOperation = NetworkOperation(url: forecastURL)
      networkOperation.downloadJsonFromUrl {
        (let JSONDictionary) in
      }
      
    } else {
      println("Could not construct a valid URL")
    }
    
  }
  
  func currentWeatherFromJsonDictionary(jsonDictionary: [String: AnyObject]?) -> CurrentWeather? {
    
    if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject] {
      return CurrentWeather(weatherDictionary: currentWeatherDictionary)
    } else
    {
      println("JSON dictionary returned nil for \"currently\" key.")
      return nil
      
    }
  }
  
  
}
