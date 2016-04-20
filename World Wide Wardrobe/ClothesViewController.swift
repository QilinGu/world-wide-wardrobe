//
//  ClothesViewController.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 4/7/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit
import SafariServices

class ClothesViewController: UIViewController, UITableViewDataSource, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    var clothes = clothingItem(clothingItemImage: UIImage(named: "placeholder")!)
    var clothesArray : [clothingItem] = []
    var pickerFrame: CGRect = CGRectMake(17, 52, 270, 100); // CGRectMake(left), top, width, height) - left and top are like margins
    
    @IBOutlet weak var clothingItemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clothingItemImageView.image = clothes.clothingItemImage
        imagePicker.delegate = self
       clothesArray.append(clothingItem(clothingType: "Top"))
        clothesArray.append(clothingItem(clothingType: "Bottom"))
        clothesArray.append(clothingItem(clothingType: "Shoes"))
            }
    
    
    func showPickerInActionSheet(sentBy: String) {
        var title = "Save"
        var message = "What clothing type is this?"
        var picker: UIPickerView = UIPickerView(frame: pickerFrame)
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.ActionSheet);
        alert.modalInPopover = true
       
        if(sentBy == "top"){
            picker.tag = 1;
        } else if (sentBy == "shoes"){
            picker.tag = 2;
        } else if (sentBy == "shoes"){
                picker.tag = 3;
        } else {
            picker.tag = 0;
        }
     //   picker.delegate = self
      //  picker.dataSource = self
    }
    
    
    //puts pictures of clothes into clothingItemImageView
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.clothingItemImageView.image = selectedImage
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("My Cell", forIndexPath: indexPath)
       cell.textLabel?.text = clothesArray[indexPath.row].clothingType
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
    
    @IBAction func onTappedSave(sender: AnyObject) {
        let alert = UIAlertController(title: "What is this item?", message: nil, preferredStyle: .Alert)
  //      alert.view.addSubview(picker)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Save", style: .Default) { (action) -> Void in
            
        }
        
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
}
