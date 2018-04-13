import Foundation

extension LandingCollectionUpdateFactory {
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol] {
        let update:CollectionUpdateDeleteSections = CollectionUpdateDeleteSections()
        update.index = index
        return [update]
    }
}
