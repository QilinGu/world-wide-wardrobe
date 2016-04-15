//
//  ModalInstructionsViewController.swift
//  World Wide Wardrobe
//
//  Created by Robert McGinness on 4/15/16.
//  Copyright © 2016 $wag Productions. All rights reserved.
//

import UIKit

class ModalInstructionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onDoneButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
