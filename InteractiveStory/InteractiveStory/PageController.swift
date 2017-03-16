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
        artworkView.image = page.story.artwork
      }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    view.addSubview(artworkView)
    artworkView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      artworkView.topAnchor.constraint(equalTo: view.topAnchor),
      artworkView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      artworkView.rightAnchor.constraint(equalTo: view.rightAnchor),
      artworkView.leftAnchor.constraint(equalTo: view.leftAnchor)
      
      ])
    
    
  }
  
}
