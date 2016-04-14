//
//  ClothesViewController.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 4/7/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit
import SafariServices

class ClothesViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    var clothes = clothingItem(clothingItemImage: UIImage(named: "placeholder")!)
    var clothesArray : [clothingItem] = []

    @IBOutlet weak var clothingItemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clothingItemImageView.image = clothes.clothingItemImage
        imagePicker.delegate = self
            }
    
    //puts pictures of clothes into clothingItemImageView
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.clothingItemImageView.image = selectedImage
        }
    }
    
    //allows user to go to library
    @IBAction func onTappedLibraryButton(sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    //allows user to go to camera
    @IBAction func onTappedCameraButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func onTappedSaveButton(sender: AnyObject) {
        let alert = UIAlertController(title: "What is this item?", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Item"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Save", style: .Default) { (action) -> Void in
            
           }
        
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}
