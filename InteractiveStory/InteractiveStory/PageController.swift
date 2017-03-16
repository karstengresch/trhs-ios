//
//  PageController.swift
//  InteractiveStory
//
//  Created by Karsten Gresch on 15.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

class PageController: UIViewController {
  
  var page: Page?
  
  // MARK: User Interface Properties
  let artworkView = UIImageView()
  let storyLabel = UILabel()
  let firstChoiceButton = UIButton(type: .system)
  let secondChoiceButton = UIButton(type: .system)
  
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
  }
  
  init(xPage: Page) {
    page = xPage
    super.init(nibName: nil, bundle: nil)
    
  }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
      
      if let page = page {
        print(page.story.text)
      }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

  }
  
}
