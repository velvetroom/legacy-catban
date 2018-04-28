import Foundation

extension Landing {
    func updateProject(name:String) {
        self.project.name = name
        self.board.saveProject()
        self.reloadViewModel()
    }
    
    func deleteProject() throws {
        let updates:[UpdateProtocol] = try self.update.deleteProject(
            board:self.board)
        self.board.apply(updates:updates)
        self.reloadViewModel()
        self.presenter.apply(updates:updates)
    }
    
    func createProject() {
        let updates:[UpdateProtocol] = self.update.createProject()
        self.board.apply(updates:updates)
        self.reloadViewModel()
        self.presenter.apply(updates:updates)
    }
}
