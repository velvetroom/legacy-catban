import Foundation

class ProjectSynched:Project, ProjectSynchedProtocol {
    var remoteIdentifier:String
    var downloadTimestamp:Int
    var uploadTimestamp:Int
    var changeTimestamp:Int
    
    override init() {
        self.remoteIdentifier = String()
        self.downloadTimestamp = 0
        self.uploadTimestamp = 0
        self.changeTimestamp = 0
        super.init()
    }
    
    override func copy(project:ProjectProtocol) {
        super.copy(project:project)
        if let project:ProjectSynchedProtocol = project as? ProjectSynchedProtocol {
            self.remoteIdentifier = project.remoteIdentifier
            self.uploadTimestamp = project.uploadTimestamp
            self.downloadTimestamp = project.downloadTimestamp
            self.changeTimestamp = project.changeTimestamp
        }
    }
}
