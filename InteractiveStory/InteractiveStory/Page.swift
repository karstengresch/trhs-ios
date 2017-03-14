//
//  Page.swift
//  InteractiveStory
//
//  Created by Karsten Gresch on 13.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import Foundation

class Page {
  let story: Story
  
  typealias Choice = (title: String, page: Page)
  
  var firstChoice: Choice?
  var secondChoice: Choice?
  
  init(xStory: Story) {
    story = xStory
  }
  
}

extension Page {
  func addChoiceWith(title: String, page: Page) -> Page {
    
    guard firstChoice != nil && secondChoice != nil else { return self }
    
    if firstChoice == nil {
      firstChoice = (title, page)
    } else {
      secondChoice = (title, page)
    }
    
    return page
  }
  
  
}

