//
//  clothingItemDetailViewController.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 5/2/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit

class clothingItemDetailViewController: UIViewController {

    var detailClothingItem = clothingItem(name: "", clothingItemType: 1, image: UIImage(named: "placeholder")!)
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailSegmentedController: UISegmentedControl!
    
    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var clothingCategoryTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImageView.image = detailClothingItem.image
        nameTextBox.text = detailClothingItem.name
        detailSegmentedController.selectedSegmentIndex = detailClothingItem.clothingItemType - 1
        
    }


}
