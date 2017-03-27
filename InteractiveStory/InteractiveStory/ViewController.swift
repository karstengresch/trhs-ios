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
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var textFieldBottomConstraint: NSLayoutConstraint!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    
    
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
            
            pageController.page = Adventure.story(withName: name.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
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

  func keyboardWillShow(_ notification: Notification) {
    if let userInfo = notification.userInfo, let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue {
      let keyboardFrameRectangle = keyboardFrame.cgRectValue
      textFieldBottomConstraint.constant = keyboardFrameRectangle.size.height + 10
      
      UIView.animate(withDuration: 0.8) {
        self.view.layoutIfNeeded()
      }
    }
  }
  
  func keyboardWillHide(_ notification: Notification) {
      let startButtonRectangle = startButton.frame.standardized
      textFieldBottomConstraint.constant = startButtonRectangle.size.height + 24
    
      UIView.animate(withDuration: 0.8) {
        self.view.layoutIfNeeded()
      }
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }

  
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    nameTextField.resignFirstResponder()
    return true
  }
}


