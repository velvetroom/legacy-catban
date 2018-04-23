import Foundation

extension LandingCollectionUpdateFactory {
    func createColumnIn(project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        let update:CollectionUpdateCreateSections = CollectionUpdateCreateSections()
        update.section = project.columns.count
        return [update]
    }
    
    func createProject() -> [CollectionUpdateProtocol] {
        let create:CollectionUpdateCreateProject = CollectionUpdateCreateProject()
        let close:CollectionUpdateCloseProject = CollectionUpdateCloseProject()
        let open:CollectionUpdateOpenProject = CollectionUpdateOpenProject()
        open.updateIndexWith(project:create.project)
        let updates:[CollectionUpdateProtocol] = [
            close,
            open,
            create]
        return updates
    }
}
