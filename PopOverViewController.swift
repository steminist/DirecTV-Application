//
//  PopOverViewController.swift
//  DirectHealth
//
//  Created by AP  on 4/4/15.
//  Copyright (c) 2015 AP . All rights reserved.
//

import Foundation

import UIKit

class PopOverViewController: UIViewController {

    @IBAction func swipeDown(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
    }
}
