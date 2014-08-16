//
//  HttpPost.swift
//  Rest Less
//
//  Created by Dylan Krause on 8/16/14.
//  Copyright (c) 2014 newts. All rights reserved.
//

import Foundation
func HTTPostJSON(url: String,
    jsonObj: AnyObject)
{
    
    var request = NSMutableURLRequest(URL: NSURL(string: url))
    var session = NSURLSession.sharedSession()
    
    var jsonError:NSError?
    request.HTTPMethod = "POST"
    request.HTTPBody = NSJSONSerialization.dataWithJSONObject( jsonObj, options: nil, error: &jsonError)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    var subTask = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
        
        var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
        
        var jsonRError: NSError?
        var json_response = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &jsonRError) as? NSDictionary
        println(jsonRError)
        jsonRError?
        if jsonRError? != nil {
            println(jsonRError!.localizedDescription)
        }
        else {
            println(json_response)
        }
    })
    subTask.resume()
}
