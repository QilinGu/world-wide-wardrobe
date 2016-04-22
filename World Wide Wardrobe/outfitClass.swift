//
//  outfitClass.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 4/8/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit

class outfitObject: NSObject {
    
    var topImage = UIImage(named: "placeholder")
    var bottomImage = UIImage(named: "placeholder")
    var shoesImage = UIImage(named: "placeholder")
    var outfitName = ""
    var clothingType = "" 
    
    convenience init(topImage: UIImage, bottomImage: UIImage, shoesImage: UIImage,outfitName: String)
    {
        self.init()
        self.topImage = topImage
        self.bottomImage = bottomImage
        self.shoesImage = shoesImage
        self.outfitName = outfitName
    }
    
    convenience init(clothingType: String)
    {
        self.init()
        self.clothingType = clothingType
    }
    
}