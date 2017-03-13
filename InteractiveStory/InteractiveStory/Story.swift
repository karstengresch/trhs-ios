//
//  Story.swift
//  InteractiveStory
//
//  Created by Karsten Gresch on 13.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

enum Story {
  case returnTrip
  case touchDown
  case homeward
  case rover
  case cave
  case crate
  case monster
  case droid
  case home
}

extension Story {
  var artwork: UIImage {
    switch self {
    case .returnTrip: return #imageLiteral(resourceName: "ReturnTrip")
    case .touchDown: return #imageLiteral(resourceName: "TouchDown")
    case .homeward: return #imageLiteral(resourceName: "Homeward")
    case .rover: return #imageLiteral(resourceName: "Rover")
    case .cave: return #imageLiteral(resourceName: "Cave")
    case .crate: return #imageLiteral(resourceName: "Crate")
    case .monster: return #imageLiteral(resourceName: "Monster")
    case .droid: return #imageLiteral(resourceName: "Droid")
    case .home: return #imageLiteral(resourceName: "Home")
    }
  }
  
}
