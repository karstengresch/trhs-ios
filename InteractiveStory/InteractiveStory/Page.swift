//
//  Page.swift
//  InteractiveStory
//
//  Created by Karsten Gresch on 13.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import Foundation


enum AdventureError: Error {
  case nameNotProvided
}

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

struct Adventure {
  static func story(withName: String) -> Page {
    let returnTrip = Page(xStory: .returnTrip(name: withName))
    
    let touchdown = returnTrip.addChoiceWith(title: "Stop and Investigate", story: .touchDown)
    let homeward = returnTrip.addChoiceWith(title: "Continue home to Earth", story: .homeward)
    
    let rover = touchdown.addChoiceWith(title: "Explore the Rover", story: .rover(name: withName))
    let crate = touchdown.addChoiceWith(title: "Open the crate", story: .crate)
    
    homeward.addChoiceWith(title: "Head back to Mars", page: touchdown)
    let home = homeward.addChoiceWith(title: "Continue Home to Earth", story: .home)
    
    let cave = rover.addChoiceWith(title: "Explore the Coordinates", story: .cave)
    rover.addChoiceWith(title: "Return to Earth", page: home)
    
    cave.addChoiceWith(title: "Continue towards faint light", story: .droid(name: withName))
    cave.addChoiceWith(title: "Refill the ship and explore the rover", page: rover)
    
    crate.addChoiceWith(title: "Explore the Rover", page: rover)
    crate.addChoiceWith(title: "Use the key", story: .monster)
    
    return returnTrip
  }
}

