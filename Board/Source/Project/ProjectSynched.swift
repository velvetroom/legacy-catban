import Foundation

class ProjectSynched:Project, ProjectSynchedProtocol {
    var remoteIdentifier:String
    var uploaded:Int
    
    override init() {
        self.remoteIdentifier = String()
        self.uploaded = 0
        super.init()
    }
    
    override func copy(project:ProjectProtocol) {
        super.copy(project:project)
        if let project:ProjectSynchedProtocol = project as? ProjectSynchedProtocol {
            self.remoteIdentifier = project.remoteIdentifier
            self.uploaded = project.uploaded
        }
    }
}
