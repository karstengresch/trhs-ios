//
//  NetworkOperation.swift
//  Stormy
//
//  Created by Karsten Gresch on 31.08.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import Foundation

class NetworkOperation {
  
  lazy var config: NSURLSessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
  lazy var session: NSURLSession = NSURLSession(configuration: self.config)
  let queryUrl: NSURL
  
  typealias JsonDictionaryCompletion = ([String: AnyObject]? -> Void)
  
  init(url: NSURL) {
    self.queryUrl = url
  }
  
  func downloadJsonFromUrl (completion: JsonDictionaryCompletion) {
    
    let request: NSURLRequest = NSURLRequest(URL: queryUrl)
    
    let dataTask = session.dataTaskWithRequest(request) {
      (let data, let response, let error) in
      
      if let httpResponse = response as? NSHTTPURLResponse {
        switch(httpResponse.statusCode)
        {
        case 200:
          let jsonDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as? [String: AnyObject]
        default:
          println("GET request not successful: \(httpResponse.statusCode))")
        }
        
      } else {
        println("Error: Not a valid HTTP response.")
      }
    }

    dataTask.resume()
    
    
  }
  
  
  
  
}
