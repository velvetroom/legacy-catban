import Foundation

extension LandingCollectionUpdateFactory {
    func insertColumnIn(project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        let update:CollectionUpdateInsertSections = CollectionUpdateInsertSections()
        update.section = project.columns.count
        return [update]
    }
}
