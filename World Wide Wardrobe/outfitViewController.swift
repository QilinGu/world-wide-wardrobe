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
    
    @IBAction func onAddButtonTapped(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Outfit", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Outfit Here"}
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) -> Void in
            let outfitTextField = alert.textFields![0] as UITextField
            self.outfit.append(outfitObject(topImage: UIImage(named: "placeholder")!, bottomImage: UIImage(named: "placeholder4")!, shoesImage: UIImage(named: "placeholder7")!, outfitName: outfitTextField.text!))
            self.tableView.reloadData()}
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
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
