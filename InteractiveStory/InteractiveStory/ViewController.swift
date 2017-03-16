//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Karsten Gresch on 12.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let story = Page(xStory: .touchDown)
    story.firstChoice = (title: "Some Title", page: Page(xStory: .droid))
    
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
  }


}

