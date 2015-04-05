//
//  RemoteViewController.swift
//  DirectHealth
//
//  Created by AP  on 4/4/15.
//  Copyright (c) 2015 AP . All rights reserved.
//

import Foundation

import UIKit

class RemoteViewController: UIViewController {
    @IBAction func swipeLeft(sender: AnyObject) {
       self.navigationController?.popViewControllerAnimated(true)
    }
}