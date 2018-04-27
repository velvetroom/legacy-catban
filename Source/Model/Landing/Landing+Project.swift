import Foundation

extension Landing {
    func deleteProject() throws {
        let updates:[UpdateProtocol] = try self.collectionUpdateFactory.deleteProject(
            board:self.board)
        self.board.apply(updates:updates)
        self.reloadViewModel()
        self.presenter.apply(updates:updates)
    }
    
    func createProject() {
        let updates:[UpdateProtocol] = self.collectionUpdateFactory.createProject()
        self.board.apply(updates:updates)
        self.reloadViewModel()
        self.presenter.apply(updates:updates)
    }
}
