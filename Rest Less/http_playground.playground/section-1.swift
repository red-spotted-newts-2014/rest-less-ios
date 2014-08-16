import Foundation
import XCPlayground

let urlString = "http://secret-stream-5880.herokuapp.com/test_api_call"
let url = NSURL.URLWithString(urlString)
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
    
})

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)





