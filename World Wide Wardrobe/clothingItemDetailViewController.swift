//
//  clothingItemDetailViewController.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 5/2/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit

class clothingItemDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var detailClothingItem = clothingItem(name: "", clothingItemType: 1, image: UIImage(named: "placeholder")!)
    let imagePicker = UIImagePickerController() 
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailSegmentedController: UISegmentedControl!
    
    @IBOutlet weak var typePicker: UISegmentedControl!
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var clothingCategoryTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = detailClothingItem.image
        nameTextBox.text = detailClothingItem.name
        detailSegmentedController.selectedSegmentIndex = detailClothingItem.clothingItemType - 1
        imagePicker.delegate = self 
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.detailImageView.image = selectedImage
        }
    }

    @IBAction func onLibraryTappedButton(sender: AnyObject) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onCameraTappedButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! ViewController
        let type = typePicker.selectedSegmentIndex
        if(type == 0)
        {
            dvc.shirtImagesArray.append(detailImageView.image!)
        }
        if(type == 1)
        {
            dvc.pantsImagesArray.append(detailImageView.image!)
        }
        if(type == 2)
        {
            dvc.shoesImagesArray.append(detailImageView.image!)
        }
        dvc.clothesArray.append(clothingItem(name: nameTextBox.text!, clothingItemType: type, image: detailImageView.image!))
    }

}
