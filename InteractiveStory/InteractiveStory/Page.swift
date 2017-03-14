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
  
  func addChoiceWith(title: String, story: Story) -> Page {
    let page = Page(xStory: story)
    return addChoiceWith(title: title, page: page)
  }
  
  
  func addChoiceWith(title: String, page: Page) -> Page {
    
    switch(firstChoice, secondChoice) {
      case(.some, .some): return page
      case(.none, .none), (.none, .some): firstChoice = (title, page)
      case(.some, .none): secondChoice = (title, page)
    }
    
    return page
  }
  
  
}

