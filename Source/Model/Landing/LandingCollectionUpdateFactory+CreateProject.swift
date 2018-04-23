import Foundation

extension LandingCollectionUpdateFactory {
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
