
import UIKit


class WorkoutLogger {
    
    var userName: String
    var workoutName: String
    var reps = [String]()
    var times = [Double]()
    var finalTime = Double()
    var missedReps: Int {
        get {
            
            return reps.count - times.count
        }
    }
   
    init(userName:String, workoutName:String) {
        self.userName = userName
        self.workoutName = workoutName
    }
    
    func addRestTime(val:Double) -> Double {
        self.times.append(val)
        return self.times.last!
    
    }
    func returnDictInfo() ->  [String:String]{
    
       return ["userName": self.userName,
              "workoutName": self.workoutName,
              "times": "\(self.times)",
              "finalTime" : "\(self.finalTime)",
              "missedReps" : "\(self.missedReps)"]
    }

}






