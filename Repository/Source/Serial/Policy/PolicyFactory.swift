import Foundation
import Board

class PolicyFactory {
    class func makeProjectWith(string:String?) -> Policy.Project {
        guard
            let string:String = string,
            let policy:Policy.Project = Policy.Project(rawValue:string)
        else { return Policy.Project.standard }
        return policy
    }
    
    class func makeProjectWith(project:ProjectProtocol) -> Policy.Project {
        if project is ProjectSynchedProtocol {
            return Policy.Project.synched
        }
        return Policy.Project.standard
    }
    
    private init() { }
}
