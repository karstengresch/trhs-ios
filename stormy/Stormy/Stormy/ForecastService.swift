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
  let forecastBaseURL: NSURL?
  
  init(APIKey: String) {
    forecastAPIKey = APIKey
    forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    
  }
  
  func getForecast(latitude: Double, longitude: Double, completion: (Forecast? -> Void)) {
    
    if let forecastURL = NSURL(string: "\(latitude),\(longitude)", relativeToURL: forecastBaseURL) {
      println("forecastBaseURL is: \(forecastBaseURL)")
      
      let networkOperation = NetworkOperation(url: forecastURL)
      
      networkOperation.downloadJSONFromURL {
        (let JSONDictionary) in
        let forecast = Forecast(weatherDictionary: JSONDictionary)
        completion(forecast)
      }
      
    } else {
      println("Could not construct a valid URL")
    }
    
  }
  
//  func currentWeatherFromJsonDictionary(jsonDictionary: [String: AnyObject]?) -> CurrentWeather? {
//    
//    if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject] {
//      return CurrentWeather(weatherDictionary: currentWeatherDictionary)
//    } else
//    {
//      println("JSON dictionary returned nil for \"currently\" key.")
//      return nil
//      
//    }
//  }
  
  
}
