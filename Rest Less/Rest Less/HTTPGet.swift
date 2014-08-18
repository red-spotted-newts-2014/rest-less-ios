//
//  HTTPGet.swift
//  Rest Less
//
//  Created by Dylan Krause on 8/17/14.
//  Copyright (c) 2014 newts. All rights reserved.
//

import Foundation

func HTTPGetJSON(source: String) {
    let url = NSURL.URLWithString(source)
    let request = NSURLRequest(URL: url)
    let queue = NSOperationQueue()
    
    
    NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{ response, responseBody, responseError in
        if responseError {
            //handle error
            println("error")
        }
        let reponseString = NSString(data: responseBody, encoding: NSUTF8StringEncoding)
        
        var jsonError:NSError?
        
        let responseDict = NSJSONSerialization.JSONObjectWithData(responseBody, options: nil, error: &jsonError) as? NSDictionary
        jsonError?
        if jsonError? != nil {
            println("error")
            //handle data error
        }
        self.delegate?.didReceiveAPIResults(responseDict)
    })
    
}