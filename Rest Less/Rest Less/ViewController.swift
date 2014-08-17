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
    var restTime:NSTimeInterval = 90.0
    var restTimeDate: NSDate!
    var timer = NSTimer()
    var accumulatedTime = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayTimeLabel.text = secondsToDisplay(restTime)

    }
    
    @IBAction func startTimer(sender: AnyObject) {
        if timer.valid != true {
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
            restTimeDate = NSDate(timeIntervalSinceNow: restTime - accumulatedTime)
        }
    }
    
    @IBAction func pauseTimer(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func resetTimer(sender: AnyObject) {
        timer.invalidate()
        accumulatedTime = 0.0
        displayTimeLabel.text = secondsToDisplay(restTime)
    }
    
    @IBAction func sendData(sender: AnyObject) {
        
        timer.description
        HTTPostJSON("http://secret-stream-5880.herokuapp.com/exercises", params)
        
    }
    
    func updateTime() {
        accumulatedTime += timer.timeInterval
        var elapsedTime: NSTimeInterval = restTimeDate.timeIntervalSinceNow

        displayTimeLabel.text = secondsToDisplay(elapsedTime)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
