import Foundation

extension UpdateFactory {
    func deleteCardAt(index:IndexPath) -> [UpdateProtocol] {
        let update:UpdateDeleteCard = UpdateDeleteCard()
        update.index = index
        return [update]
    }
    
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [UpdateProtocol] {
        guard
            project.columns.count > Constants.minColumns
        else { throw ErrorProject.oneColumnMinimum }
        let update:UpdateDeleteColumn = UpdateDeleteColumn()
        update.index = index
        return [update]
    }
    
    func deleteProject(board:BoardProtocol) throws -> [UpdateProtocol] {
        guard
            board.projects.count > Constants.minProjects,
            let newCurrent:ProjectProtocol = self.firstProjectDifferentThanCurrent(board:board)
        else { throw ErrorProject.oneProjectMinimum }
        let delete:UpdateDeleteProject = UpdateDeleteProject()
        let close:UpdateCloseProject = UpdateCloseProject()
        let open:UpdateOpenProject = UpdateOpenProject()
        open.updateIndexWith(project:newCurrent)
        let updates:[UpdateProtocol] = [
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