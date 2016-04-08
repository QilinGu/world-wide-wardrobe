//
//  ViewController.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 4/6/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {

    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
  
    
    @IBAction func onAddButtonTapped(sender: AnyObject) {
        
    let alert = UIAlertController(title: "Add Clothes", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        alert.addAction(cancelAction)
        let confirmAction = UIAlertAction(title: "Confirm", style: .Default) { (action) -> Void in
            
        }
    }
   
    
  


}

