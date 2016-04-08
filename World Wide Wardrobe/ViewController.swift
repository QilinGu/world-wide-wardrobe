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
    
    var clothesArray : [clothingItem] = []
    var outfitsArray : [outfitObject] = []
    
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
        let addTopAction = UIAlertAction(title: "Add Top", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            self.clothesArray.append(clothingItem(name: nameTextField.text!))
            
        }
        alert.addAction(addTopAction)
        let addBottomAction = UIAlertAction(title: "Add Bottom", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            self.clothesArray.append(clothingItem(name: nameTextField.text!))
            
        }
        alert.addAction(addBottomAction)

        let addShoeAction = UIAlertAction(title: "Add Shoes", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            self.clothesArray.append(clothingItem(name: nameTextField.text!))
            
        }
        alert.addAction(addShoeAction)

        self.presentViewController(alert, animated: true, completion: nil)
    }
   
    
  


}

