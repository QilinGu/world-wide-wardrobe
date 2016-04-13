//
//  ViewController.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 4/6/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {

    @IBOutlet weak var topsImageView: UIImageView!
    @IBOutlet weak var pantsImageView: UIImageView!
    @IBOutlet weak var shoesImageView: UIImageView!
    
    @IBOutlet weak var shirtIncreaseArrow: UIButton!
    @IBOutlet weak var shirtDecreaseArrow: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    var clothesArray : [clothingItem] = []
    var outfitsArray : [outfitObject] = []
    
    var shirtImagesArray : [UIImage] = []
    var pantsImagesArray : [UIImage] = []
    var shoesImagesArray : [UIImage] = []
    
    var outfitShirtNumber = 0
    var outfitPantsNumber = 0
    var outfitShoesNumber = 0
    
    
    
    func checkArrowAlpha()
    {
        if outfitShirtNumber == 0
        {
            shirtDecreaseArrow.alpha = 0.5
        } else {
            shirtDecreaseArrow.alpha = 1
        }
        
        if outfitShirtNumber == shirtImagesArray.count
        {
            shirtIncreaseArrow.alpha = 0.5
        } else {
            shirtIncreaseArrow.alpha = 1
        }
    }
    
    func updateOutfitImages()
    {
        if shirtImagesArray.count > 0
        {
            topsImageView.image = shirtImagesArray[outfitShirtNumber]
        }
        if pantsImagesArray.count > 0
        {
            pantsImageView.image = pantsImagesArray[outfitPantsNumber]
        }
        if shoesImagesArray.count > 0
        {
            shoesImageView.image = shoesImagesArray[outfitShoesNumber]
        }
        checkArrowAlpha()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateOutfitImages()
        checkArrowAlpha()
    }
    
    @IBAction func increaseShirtArrow(sender: AnyObject) {
        if outfitShirtNumber < shirtImagesArray.count
        {
            outfitShirtNumber++
            updateOutfitImages()
        }
    }
  
    @IBAction func decreaseShirtArrow(sender: AnyObject) {
        if outfitShirtNumber > 0
        {
            outfitShirtNumber--
            updateOutfitImages()
        }
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

