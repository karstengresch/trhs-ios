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
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
  }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

  }
  
}
