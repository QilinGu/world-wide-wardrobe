//
//  outfitViewController.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 4/7/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit

class outfitViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    @IBOutlet var addButton: UIBarButtonItem!
    
    var outfit : [outfitObject] = []
   
    override func viewDidLoad() {
        editButton.tag = 0
        super.viewDidLoad()

    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return outfit.count
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let varOutfit = outfit[sourceIndexPath.row]
        outfit.removeAtIndex(sourceIndexPath.row)
        outfit.insert(varOutfit, atIndex: destinationIndexPath.row)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel?.text = outfit[indexPath.row].outfitName
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            outfit.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.outfit = outfit[index!]
    }
    
    @IBAction func onEditButtonTapped(sender: UIBarButtonItem) {
        
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
