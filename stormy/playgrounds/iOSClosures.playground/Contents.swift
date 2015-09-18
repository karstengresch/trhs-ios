// iOS Closures
import UIKit

// UIView Animation

let someLabel = UILabel()

UIView.animateWithDuration(1.0, animations: { () -> Void in
  // animation sequence
  someLabel.alpha = 0.3 })
  { (failure: Bool) -> Void in
    // when animation completes, execute this closure
}

// Network request
let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
let url = NSURL(string: "http://blog.teamtreehouse.com/api/get_recent_summary/?count=20")
let request = NSURLRequest(URL: url!)

let downloadTask = session.downloadTaskWithRequest(request,
  completionHandler: {
    (url: NSURL?, response: NSURLResponse?, error: NSError?) -> Void in
    // closure body execution
})

let downloadTaskShorthand = session.downloadTaskWithRequest(request) {
  (let url, let response, let error) in
  // closure body execution
}

downloadTask.resume()

// Typealias
typealias JSONDictionaryCompletion = ([String:AnyObject]?) -> ()

func downloadJSONFromURL (completion: JSONDictionaryCompletion ) {
  
}

func getRecentBlogPosts(completion: (NSURLResponse? -> Void)) {
  _ = session.downloadTaskWithRequest(request) {
    (let url, let response, let error) in
    completion(response)
  }
}

getRecentBlogPosts {
  (let response) in
  
}