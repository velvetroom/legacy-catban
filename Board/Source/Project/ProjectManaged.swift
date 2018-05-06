import Foundation

class ProjectManaged:Project, ProjectManagedProtocol {
    var manager:ProjectManagerProtocol
    
    override init() {
        self.manager = Board()
        super.init()
    }
}
