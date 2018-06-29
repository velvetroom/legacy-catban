import Foundation

class ProjectSynched:Project, ProjectSynchedProtocol {
    var downloadTimestamp:Int
    var uploadTimestamp:Int
    var changeTimestamp:Int
    
    override init() {
        self.downloadTimestamp = 0
        self.uploadTimestamp = 0
        self.changeTimestamp = 0
        super.init()
    }
    
    override func copy(project:ProjectProtocol) {
        super.copy(project:project)
        
    }
}
