//
//  DailyWeatherViewController.swift
//  Stormy
//
//  Created by Karsten Gresch on 11.09.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import UIKit

class DailyWeatherViewController: UIViewController {
  
  @IBOutlet weak var weatherIcon: UIImageView?
  @IBOutlet weak var summaryLabel: UILabel?
  @IBOutlet weak var sunriseLabel: UILabel?
  @IBOutlet weak var sunsetLabel: UILabel!
  @IBOutlet weak var lowTemperatureLabel: UILabel!
  @IBOutlet weak var highTemperatureLabel: UILabel!
  @IBOutlet weak var precipitationLabel: UILabel!
  @IBOutlet weak var humidityLabel: UILabel!

  
  
  
  var dailyWeather: DailyWeather? {
    didSet {
      configureView()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    
  }
  
  func configureView() {
    if let weather = dailyWeather {
      weatherIcon?.image = weather.largeIcon
      summaryLabel?.text = weather.summary
      sunriseLabel?.text = weather.sunriseTime
      sunsetLabel?.text = weather.sunsetTime
      
      if let lowTemperature = weather.minTemperature,
         let highTemperature = weather.maxTemperature,
         let rain = weather.preciperationChance,
        let humidity = weather.humidity {
          lowTemperatureLabel?.text = "\(lowTemperature)°"
          highTemperatureLabel?.text = "\(highTemperature)°"
          precipitationLabel?.text = "\(rain)%"
          humidityLabel?.text = "\(humidity)%"
      }
      
      
      self.title = weather.day
    }
    
    // Configure navbar back button
    if let buttonFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
      let barButtonAttributesDictionary: [NSObject: AnyObject]? = [
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: buttonFont
      ]
      UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributesDictionary, forState: .Normal)
    }

    
    
    
    
    
    
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
