//
//  ViewController.swift
//  Rest Less
//
//  Created by Dylan Krause on 8/15/14.
//  Copyright (c) 2014 newts. All rights reserved.
//


import UIKit

func secondsToDisplay(var time: NSTimeInterval) -> String{
    
    let minutes = UInt8(time / 60.0)
    time -= (NSTimeInterval(minutes) * 60)

    let seconds = UInt8(time)
    time -= NSTimeInterval(seconds)

    let fraction = UInt8(time * 100)
    
    let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
    let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
    let strFraction = fraction > 9 ? String(fraction):"0" + String(fraction)

    return "\(strMinutes):\(strSeconds):\(strFraction)"
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    var startTime = NSTimeInterval()
    var restTime:NSTimeInterval = 90
    var restTimeDate: NSDate!
    var timer = NSTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayTimeLabel.text = secondsToDisplay(restTime)
        
        restTimeDate = NSDate(timeIntervalSinceNow: restTime)
    }
    
    @IBAction func startTimer(sender: AnyObject) {
        if !timer.valid {
            //            startTime.advancedBy(2000)
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()

        }
    }
    
    @IBAction func pauseTimer(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func resetTimer(sender: AnyObject) {
        timer.invalidate()
        
        displayTimeLabel.text = secondsToDisplay(restTime)
    }
    
    
    func updateTime() {
        
        var elapsedTime: NSTimeInterval = restTimeDate.timeIntervalSinceNow

        displayTimeLabel.text = secondsToDisplay(elapsedTime)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

