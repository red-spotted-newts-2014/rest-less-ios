//
//  ViewController.swift
//  Rest Less
//
//  Created by Dylan Krause on 8/15/14.
//  Copyright (c) 2014 newts. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    var startTime = NSTimeInterval()
    
    
    var timer = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayTimeLabel.text = "00:02:00"
        
        
        
    }
    
    @IBAction func startTimer(sender: AnyObject) {
        if !timer.valid {
            //            startTime.advancedBy(2000)
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
            //            startTime = NSDate.timeIntervalSinceReferenceDate()
            
        }
    }
    
    @IBAction func pauseTimer(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func resetTimer(sender: AnyObject) {
        timer.invalidate()
        
        displayTimeLabel.text = "00:02:00"
        
    }
    
    
    func updateTime() {
        
        
        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        //        var currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        println(seconds)
        let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let strFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        println(strFraction)
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        displayTimeLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

