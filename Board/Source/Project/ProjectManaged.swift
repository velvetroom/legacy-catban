import Foundation

class ProjectManaged:Project, ProjectManagedProtocol {
    var manager:BoardProjectsProtocol
    
    override init() {
        self.manager = Board()
        super.init()
    }
}
