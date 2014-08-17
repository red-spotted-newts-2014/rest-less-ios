//
//  SecondsToDisplay.swift
//  Rest Less
//
//  Created by Michael Weiss on 8/17/14.
//  Copyright (c) 2014 newts. All rights reserved.
//

import Foundation

func secondsToDisplay(var time: NSTimeInterval) -> String{
    if time <= 0 {
        return "00:00:00"
    }
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