import Foundation

extension LandingCollectionUpdateFactory {
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol] {
        guard
            project.columns.count > Constants.minColumns
        else { throw ErrorProject.oneColumnMinimum }
        let update:CollectionUpdateDeleteSections = CollectionUpdateDeleteSections()
        update.index = index
        return [update]
    }
    
    func deleteProject(board:BoardProtocol) throws -> [CollectionUpdateProtocol] {
        guard
            board.projects.count > Constants.minProjects,
            let newCurrent:ProjectProtocol = self.firstProjectDifferentThanCurrent(board:board)
        else { throw ErrorProject.oneProjectMinimum }
        let delete:CollectionUpdateDeleteProject = CollectionUpdateDeleteProject()
        let close:CollectionUpdateCloseProject = CollectionUpdateCloseProject()
        let open:CollectionUpdateOpenProject = CollectionUpdateOpenProject()
        open.updateIndexWith(project:newCurrent)
        let updates:[CollectionUpdateProtocol] = [
            close,
            open,
            delete]
        return updates
    }
    
    private func firstProjectDifferentThanCurrent(board:BoardProtocol) -> ProjectProtocol? {
        for project:ProjectProtocol in board.projects {
            if project.identifier != board.project.identifier {
                return project
            }
        }
        return nil
    }
}
