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

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
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
    
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
       let clothes = clothesArray[sourceIndexPath.row]
       clothesArray.removeAtIndex(sourceIndexPath.row)
       clothesArray.insert(clothes, atIndex: destinationIndexPath.row)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothesArray.count
    }

    @IBAction func onTappedEdit(sender: UIBarButtonItem) {
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
        }
        else {
            tableView.editing = false
            sender.tag = 0
        }
    }
    
    
    
}
