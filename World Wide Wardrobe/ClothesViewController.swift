//
//  ClothesViewController.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 4/7/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit
import SafariServices

class ClothesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var clothes = clothingItem(clothingItemImage: UIImage(named: "placeholder")!)
    var clothesArray : [clothingItem] = []
    var outfitsArray : [outfitObject] = []
    var clothesImages : outfitObject?

    @IBOutlet weak var clothesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = clothesTableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = clothesArray[indexPath.row].name
        cell.imageView?.image = clothesArray[indexPath.row].image
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
        clothesArray.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }

    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
      return true
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
       let clothes = clothesArray[sourceIndexPath.row]
       clothesArray.removeAtIndex(sourceIndexPath.row)
       clothesArray.insert(clothes, atIndex: destinationIndexPath.row)
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
    

    //define what type of clothing item the image is
    @IBAction func nameButton(sender: AnyObject) {
        let alert = UIAlertController(title: "Add Clothes", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        alert.addAction(cancelAction)
        let addTopAction = UIAlertAction(title: "Add Top", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            self.clothesArray.append(clothingItem(name: nameTextField.text!,image: UIImage(named: "placeholder")!))
          //  self.shirtImagesArray.append(self.clothesArray[self.clothesArray.count - 1].image!)
         //   self.checkArrowAlpha()
            
        }
        alert.addAction(addTopAction)
        let addBottomAction = UIAlertAction(title: "Add Bottom", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            self.clothesArray.append(clothingItem(name: nameTextField.text!,image: UIImage(named: "placeholder4")!))
         //   self.shirtImagesArray.append(self.clothesArray[self.clothesArray.count - 1].image!)
         //   self.checkArrowAlpha()
        }
        alert.addAction(addBottomAction)
        
        let addShoeAction = UIAlertAction(title: "Add Shoes", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            self.clothesArray.append(clothingItem(name: nameTextField.text!,image: UIImage(named: "placeholder7")!))
         //   self.shirtImagesArray.append(self.clothesArray[self.clothesArray.count - 1].image!)
         //   self.checkArrowAlpha()
            
        }
        alert.addAction(addShoeAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwindToClothesArray(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? ViewController, clothesImages = sourceViewController.clothesImages {
            outfitsArray.append(clothesImages)
        }
    }
    
}
