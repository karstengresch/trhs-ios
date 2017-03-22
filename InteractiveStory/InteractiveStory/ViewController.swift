//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Karsten Gresch on 12.03.17.
//  Copyright © 2017 Closure One. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var nameTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let story = Page(xStory: .touchDown)
    story.firstChoice = (title: "Some Title", page: Page(xStory: .droid(name: "Droid")))
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "startAdventure" {
      
      do {
        if let name = nameTextField.text {
          if name.isEmpty {
            throw AdventureError.nameNotProvided
          } else {
            guard let pageController = segue.destination as? PageController else { return }
            
            pageController.page = Adventure.story(withName: "Ugolina")
          }
        }
      }
      catch AdventureError.nameNotProvided {
        let alertController = UIAlertController(title: "Name not provided", message: "Please provide a name", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
      }
      catch let error {
        fatalError("\(error.localizedDescription)")
      }
    }
  }
}

