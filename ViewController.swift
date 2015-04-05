//
//  ViewController.swift
//  DirectHealth
//
//  Created by AP  on 4/4/15.
//  Copyright (c) 2015 AP . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //-----------------PAGEVIEWCODESTART-----------------
    //    private var pageViewController: UIPageViewController?
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //    }
    //    private func createPageViewController() {
    //        let pageControl = self.storyboard!.instantiateViewControllerWithIdentifier(")
    //    }
    
    //-----------------PAGEVIEWCODEEND-------------------
    
    let manager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if manager.accelerometerAvailable {
            let queue = NSOperationQueue()
            //manager.accelerometerUpdateInterval = 0.01
            manager.startAccelerometerUpdatesToQueue(queue, withHandler:
                {(data: CMAccelerometerData!, error: NSError!) in
                    
                    println("X = \(data.acceleration.x)")
                    println("Y = \(data.acceleration.y)")
                    println("Z = \(data.acceleration.z)")
                }
            )
        } else {
            println("Accelerometer is not available")
        }
    }
    
    @IBAction func cardio(sender: UIButton) {
        let url = NSURL(string: "http://10.125.1.147:8080/itv/startURL?url=http://10.125.1.138/directv-application")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            //println(NSString(data: data, encoding: NSUTF8StringEncoding))
            //If it works fine
            if (error != nil) {
                //If there is an error, have a dialog box pop-up
                println("OOPS")
                let alertController = UIAlertController(title: "iOScreator", message:"Error! Turn on TV!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            else {
                dispatch_async(dispatch_get_main_queue()){
                    self.performSegueWithIdentifier("ChoseWorkoutSegue", sender: self)
                }
            }
        }
        
        task.resume()
    }
    
    @IBAction func swiperight(sender: AnyObject) {
        self.performSegueWithIdentifier("SwipeSegue", sender: self)
    }
    
    
    
}