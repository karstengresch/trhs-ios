//
//  DailyWeather.swift
//  Stormy
//
//  Created by Karsten Gresch on 07.09.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import Foundation
import UIKit

struct DailyWeather {
  
  let maxTemperature: Int?
  let minTemperature: Int?
  let humidity: Int?
  let preciperationChance: Int?
  let summary: String?
  var icon: UIImage? = UIImage(named: "default.png")
  var largeIcon: UIImage? = UIImage(named: "default_large.png")
  var sunriseTime: String?
  var sunsetTime: String?
  var day: String?
  let dateFormatter = NSDateFormatter()
  
  init(dailyweatherData: [String: AnyObject]) {
    maxTemperature = dailyweatherData["temperatureMax"] as? Int
        minTemperature = dailyweatherData["temperatureMin"] as? Int
    
    if let humidityFloat = dailyweatherData["humidity"] as? Double {
      humidity = Int(humidityFloat * 100)
    } else {
      humidity = nil
    }
    if let preciperationChanceFloat = dailyweatherData["precipProbability"] as? Double {
      preciperationChance = Int(preciperationChanceFloat * 100)
    } else {
      preciperationChance = nil
    }
   
    summary = dailyweatherData["summary"] as? String
    
    if let iconString = dailyweatherData["icon"] as? String,
       let iconEnum = Icon(rawValue: iconString) {
          (icon, largeIcon) = iconEnum.toImage()
    }
    
    if let sunriseDate = dailyweatherData["sunriseTime"] as? Double {
      sunriseTime = timeStringFromUnixTime(sunriseDate)
    } else {
      sunriseTime = nil
    }
    
    if let sunsetDate = dailyweatherData["sunsetTime"] as? Double {
      sunsetTime = timeStringFromUnixTime(sunsetDate)
    } else {
      sunsetTime = nil
    }
    
    if let time = dailyweatherData["time"] as? Double {
      day = dayStringFromTime(time)
    }
    
    
  }
  
  func timeStringFromUnixTime(unixTime: Double) -> String {
    let date = NSDate(timeIntervalSince1970: unixTime)
    // "hh:mm a"
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.stringFromDate(date)
  }
  
  func dayStringFromTime(time: Double) -> String {
    let date = NSDate(timeIntervalSince1970: time)
    dateFormatter.locale = NSLocale(localeIdentifier: NSLocale.currentLocale().localeIdentifier)
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.stringFromDate(date)
  }
  
}
