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
    
  }
  
  
}
