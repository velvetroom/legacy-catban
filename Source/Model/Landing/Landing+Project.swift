import Foundation

extension Landing {
    func updateProject(name:String) {
        self.project.name = name
        self.board.saveProject()
        self.reloadViewModel()
    }
    
    func deleteProject() throws {
        let updates:[UpdateProtocol] = try self.update.deleteProject(board:self.board)
        self.applyUpdates(updates:updates)
    }
    
    func createProject() {
        let updates:[UpdateProtocol] = self.update.createProject()
        self.applyUpdates(updates:updates)
    }
}
