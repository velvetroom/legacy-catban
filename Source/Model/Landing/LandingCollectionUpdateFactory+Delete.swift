import Foundation

extension LandingCollectionUpdateFactory {
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol] {
        guard
            project.columns.count > 1
        else {
            throw ErrorProject.oneColumnMinimum
        }
        let update:CollectionUpdateDeleteSections = CollectionUpdateDeleteSections()
        update.index = index
        return [update]
    }
}
