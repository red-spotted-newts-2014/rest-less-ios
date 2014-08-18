//
//  APIGetWorkoutController.swift
//  Rest Less
//
//  Created by Dylan Krause on 8/17/14.
//  Copyright (c) 2014 newts. All rights reserved.
//

import Foundation

protocol APIGetWorkoutControllerProtocol{
    func receivedGetResponse(result: NSDictionary) -> NSDictionary
}

class APIGetWorkoutController {
    var delegate: APIGetWorkoutControllerProtocol?
    var JSONResponse: NSDictionary?
    var JSONError: NSError?
    init(){}
    
    func HTTPGetter(source: String) {
        
        let url = NSURL.URLWithString(source)
        let request = NSURLRequest(URL: url)
        let queue = NSOperationQueue()
        
        var responseString: NSString?
        
        NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{ response, responseBody, responseError in
            
            if (responseError != nil) {
                //handle error
                println("error")
            }
            let reponseString = NSString(data: responseBody, encoding: NSUTF8StringEncoding)
            
            var jsonError:NSError?
            
            var responseDict = NSJSONSerialization.JSONObjectWithData(responseBody, options: nil, error: &jsonError) as NSDictionary
            println(responseDict)
            println("\(responseBody)")
            self.delegate?.receivedGetResponse(responseDict)
            jsonError?
            if jsonError? != nil {
                println("error")
                //handle data error
            }
        })
        
    }
}