//
//  Audio.swift
//  InteractiveStory
//
//  Created by Karsten Gresch on 27.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import Foundation
import AudioToolbox

extension Story {
  
  var soundEffectName: String {
    switch self {
      case .droid, .home: return "HappyEnding"
      case .monster: return "Ominous"
      default: return "PageTurn"
      
    }
  }
  
  
  var soundEffectUrl: URL {
    let path = Bundle.main.path(forResource: soundEffectName, ofType: "wav")!
    return URL(fileURLWithPath: path)
  }
}


class SoundsEffectsPlayer {
  var sound: SystemSoundID = 0
  
  func playSound(for story: Story) {
    let soundUrl = story.soundEffectUrl as CFURL
    
    AudioServicesCreateSystemSoundID(soundUrl, &sound)
    
  }
}
