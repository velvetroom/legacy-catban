import Foundation

extension UpdateFactory {
    func createCard(indexPath:IndexPath) -> [UpdateProtocol] {
        let update:UpdateCreateCard = UpdateCreateCard()
        update.indexPath = indexPath
        return [update]
    }
    
    func createColumnIn(project:ProjectProtocol) -> [UpdateProtocol] {
        let update:UpdateCreateSection = UpdateCreateSection()
        update.section = project.columns.count
        return [update]
    }
    
    func createProject() -> [UpdateProtocol] {
        let create:UpdateCreateProject = UpdateCreateProject()
        let close:UpdateCloseProject = UpdateCloseProject()
        let open:UpdateOpenProject = UpdateOpenProject()
        open.updateIndexWith(project:create.project)
        let updates:[UpdateProtocol] = [
            close,
            open,
            create]
        return updates
    }
}
