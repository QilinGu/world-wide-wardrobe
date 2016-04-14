//
//  clothingItem.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 4/7/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit

class clothingItem: NSObject {
    var name = ""
    var image = UIImage(named: "placeholder")
    var clothingItemType = 0
    //0 is shirt
    //1 is pants
    //2 is shoes
    var clothingType = ""   //types such as "Formalwear", "Casualwear", etc.
    var clothingItemImage = UIImage(named: "placeholder")
    
    convenience init(clothingItemImage: UIImage){
        self.init()
        self.clothingItemImage = clothingItemImage
    }

    convenience init(name: String,image: UIImage)
    {
        self.init()
        self.name = name
        self.image = image
    }
    
    convenience init(clothingType: String)
    {
        self.init()
        self.clothingType = clothingType 
    }
    
}
