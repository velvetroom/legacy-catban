import Foundation

extension LandingCollectionUpdateFactory {
    func createColumnIn(project:ProjectProtocol) -> [UpdateProtocol] {
        let update:UpdateCreateSections = UpdateCreateSections()
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
