import Foundation
import XCPlayground

let urlString = "http://localhost:3000/workouts/1.json"

protocol APIControllerProtocol{
    func receivedGetResponse(result: NSDictionary) -> NSDictionary
}

class APIController {
    var delegate: APIControllerProtocol?
    var JSONResponse: NSDictionary?
    var JSONError: NSError?
    init(){}
    
    func HTTPGetJSON(source: String) {
        
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

class Controller: APIControllerProtocol {
    
    var response:NSDictionary?
    func receivedGetResponse(result: NSDictionary) -> NSDictionary {
     
        println(result)
        response = result
        println(response)
        return response!
    }
    
    func call() {
        var api = APIController()
        api.delegate = self
        api.HTTPGetJSON(urlString)
    }

}
var cont = Controller()
cont.call()



//HTTPGetJSON(urlString)

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)





