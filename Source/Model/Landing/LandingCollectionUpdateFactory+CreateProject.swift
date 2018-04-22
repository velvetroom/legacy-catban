import Foundation

extension LandingCollectionUpdateFactory {
    func createProject() -> [CollectionUpdateProtocol] {
        let update:CollectionUpdateCreateProject = CollectionUpdateCreateProject()
        return [update]
    }
}
