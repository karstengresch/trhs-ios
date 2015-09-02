//
//  CurrentWeather.swift
//  Stormy
//
//  Created by Karsten Gresch on 28.08.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import Foundation
import UIKit

enum icon: String {
  case ClearDay = "clear-day"
  case ClearNight = "clear-night"
  case Rain = "rain"
  case Snow = "snow"
  case Sleet = "sleet"
  case Wind = "wind"
  case Fog = "fog"
  case Cloudy = "cloudy"
  case PartlyCloudyDay = "partly-cloudy-day"
  case PartlyCloudyNight = "partly-cloudy-night"
}

struct CurrentWeather {
  
  let temperature: Int?
  let humidity: Int?
  let precipProbability: Int?
  let summary: String?
  let icon: UIImage? = UIImage(named: "default.png")
  
  init(weatherDictionary: [String: AnyObject] ) {
    temperature = weatherDictionary["temperature"] as? Int
    if let humidityFloat = weatherDictionary["humidity"] as? Double
    {
     humidity = Int(humidityFloat * 100)
    } else {
      humidity = nil
    }
    
    if let precipFloat = weatherDictionary["precipProbability"] as? Double
    {
      precipProbability = Int(precipFloat * 100)
    } else {
      precipProbability = nil
    }
    
    if let iconString = weatherDictionary["icon"] as? String {
        icon = weatherImageFromIconString(iconString)
    } else {
      
    }
    
    
    summary = weatherDictionary["summary"] as? String
    
    
  }
  
  func weatherImageFromIconString(iconString: String) -> UIImage? {
    var imageName: String
    
    return UIImage(named: imageName)
    
  }
  
}

