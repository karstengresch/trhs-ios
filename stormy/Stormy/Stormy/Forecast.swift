//
//  Forecast.swift
//  Stormy
//
//  Created by Karsten Gresch on 09.09.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import Foundation

struct Forecast {
  var currentWeather: CurrentWeather?
  var weekly: [DailyWeather] = []
  
  init(weatherDictionary: [String: AnyObject]?) {
    if let currentWeatherDictionary = weatherDictionary?["currently"] as? [String: AnyObject]
    {
      currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
    }
    
    if let weeklyWeatherArray = weatherDictionary?["daily"]?["data"] as? [[String: AnyObject]] {
      for dailyWeather in weeklyWeatherArray {
        let daily = DailyWeather(dailyweatherData: dailyWeather)
        weekly.append(daily)
      }
    }
  }

}