import Foundation

extension Landing {
    func deleteProject() throws {
        guard
            self.board.projects.count > Constants.minProjects
            else { throw ErrorProject.oneProjectMinimum }
        self.board.deleteProject()
        self.reloadViewModel()
    }
    
    func createProject() {
        let updates:[CollectionUpdateProtocol] = self.collectionUpdateFactory.createProject()
        self.board.apply(updates:updates)
        self.reloadViewModel()
        self.presenter.apply(updates:updates)
    }
}
