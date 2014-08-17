
import UIKit


class WorkoutLogger {
    
    var userName: String
    var workoutName: String
    var reps = [String]()
    var plannedTimes: [Int]
    var actualTimes = [Double]()
    var finalTime = Double()
    var missedReps: Int {
        get {
            
            return reps.count - actualTimes.count
        }
    }
   
    init(userName:String, workoutName:String, plannedTimes:[Int]) {
        self.userName = userName
        self.workoutName = workoutName
        self.plannedTimes = plannedTimes
    }
    
    func addRestTime(val:Double) -> Double {
        self.actualTimes.append(val)
        return self.actualTimes.last!
    
    }
    func returnDictInfo() ->  [String:String]{
    
       return ["userName": self.userName,
              "workoutName": self.workoutName,
              "times": "\(self.actualTimes)",
              "finalTime" : "\(self.finalTime)",
              "missedReps" : "\(self.missedReps)"]
    }

}








