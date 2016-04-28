//
//  ViewController.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 4/6/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var topsImageView: UIImageView!
    @IBOutlet weak var pantsImageView: UIImageView!
    @IBOutlet weak var shoesImageView: UIImageView!
    
    @IBOutlet weak var shirtIncreaseArrow: UIButton!
    @IBOutlet weak var shirtDecreaseArrow: UIButton!
    @IBOutlet weak var pantsIncreaseArrow: UIButton!
    @IBOutlet weak var pantsDecreaseArrow: UIButton!
    @IBOutlet weak var shoesIncreaseArrow: UIButton!
    @IBOutlet weak var shoesDecreaseArrow: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    var clothesArray : [clothingItem] = []
    var outfitsArray : [outfitObject] = []
    var clothesImages : outfitObject?
    
    var shirtImagesArray : [UIImage] = [UIImage(named: "placeholder")!,UIImage(named: "placeholder2")!,UIImage(named: "placeholder3")!]
    var pantsImagesArray : [UIImage] = [UIImage(named: "placeholder4")!,UIImage(named: "placeholder5")!,UIImage(named: "placeholder6")!]
    var shoesImagesArray : [UIImage] = [UIImage(named: "placeholder7")!,UIImage(named: "placeholder8")!,UIImage(named: "placeholder9")!]
    
    var outfitShirtNumber = 0
    var outfitPantsNumber = 0
    var outfitShoesNumber = 0
    
    var outfitName = ""
    
    
    func checkArrowAlpha()
    {
        if outfitShirtNumber == 0
        {
            shirtDecreaseArrow.alpha = 0.5
        } else {
            shirtDecreaseArrow.alpha = 1
        }
        
        if outfitShirtNumber == shirtImagesArray.count - 1
        {
            shirtIncreaseArrow.alpha = 0.5
        } else {
            shirtIncreaseArrow.alpha = 1
        }
        
        if outfitPantsNumber == 0
        {
            pantsDecreaseArrow.alpha = 0.5
        } else {
            pantsDecreaseArrow.alpha = 1
        }
        
        if outfitPantsNumber == pantsImagesArray.count - 1
        {
            pantsIncreaseArrow.alpha = 0.5
        } else {
            pantsIncreaseArrow.alpha = 1
        }

        if outfitShoesNumber == 0
        {
            shoesDecreaseArrow.alpha = 0.5
        } else {
            shoesDecreaseArrow.alpha = 1
        }
        
        if outfitShoesNumber == shoesImagesArray.count - 1
        {
            shoesIncreaseArrow.alpha = 0.5
        } else {
            shoesIncreaseArrow.alpha = 1
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
    
    
    func accessLibrary() {
        self.imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.topsImageView.image = selectedImage
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "outfitSegue"
        {
            let dvc = segue.destinationViewController as! outfitViewController
            dvc.outfit = self.outfitsArray
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
        updateOutfitImages()
        checkArrowAlpha()
       
    }
    
    //On Arrow Tapped Actions
    @IBAction func increaseShirtArrow(sender: AnyObject) {
        if outfitShirtNumber < shirtImagesArray.count - 1
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
    
    @IBAction func increasePantsArrow(sender: AnyObject) {
        if outfitPantsNumber < pantsImagesArray.count - 1
        {
            outfitPantsNumber++
            updateOutfitImages()
        }
    }
    
    @IBAction func decreasePantsArrow(sender: AnyObject) {
        if outfitPantsNumber > 0
        {
            outfitPantsNumber--
            updateOutfitImages()
        }
    }
    
    @IBAction func increaseShoesArrow(sender: AnyObject) {
        if outfitShoesNumber < shoesImagesArray.count - 1
        {
            outfitShoesNumber++
            updateOutfitImages()
        }
    }
    
    @IBAction func decreaseShoesArrow(sender: AnyObject) {
        if outfitShoesNumber > 0
        {
            outfitShoesNumber--
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
            self.accessLibrary()
           
            //self.clothesArray.append(clothingItem(name: nameTextField.text!,image: UIImage(named: "placeholder")!))
            //self.shirtImagesArray.append(self.clothesArray[self.clothesArray.count - 1].image!)
            self.checkArrowAlpha()
            
        }
        alert.addAction(addTopAction)
        let addBottomAction = UIAlertAction(title: "Add Bottom", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            self.accessLibrary()
            //self.clothesArray.append(clothingItem(name: nameTextField.text!,image: UIImage(named: "placeholder4")!))
           // self.shirtImagesArray.append(self.clothesArray[self.clothesArray.count - 1].image!)
            self.checkArrowAlpha()
            
        }
        alert.addAction(addBottomAction)

        let addShoeAction = UIAlertAction(title: "Add Shoes", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField
            self.accessLibrary()
           // self.clothesArray.append(clothingItem(name: nameTextField.text!,image: UIImage(named: "placeholder7")!))
            //self.shirtImagesArray.append(self.clothesArray[self.clothesArray.count - 1].image!)
            self.checkArrowAlpha()
            
        }
        alert.addAction(addShoeAction)

        self.presentViewController(alert, animated: true, completion: nil)
    }
   
    
    @IBAction func onSaveOutfitTapped(sender: AnyObject) {
        let alert = UIAlertController(title: "Save Outfit", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Name Your Outfit"
        }
        let finishAction = UIAlertAction(title: "Finish", style: .Default) { (action) -> Void in
            let nameTextField = alert.textFields![0] as UITextField

            self.outfitName = nameTextField.text!
            self.outfitsArray.append(outfitObject(topImage: self.shirtImagesArray[self.outfitShirtNumber], bottomImage: self.pantsImagesArray[self.outfitPantsNumber], shoesImage: self.shoesImagesArray[self.outfitShoesNumber],outfitName: self.outfitName))
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        alert.addAction(finishAction)
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)

    }
  

}

