import Foundation

extension LandingCollectionUpdateFactory {
    func deleteColumnAt(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        let update:CollectionUpdateDeleteSections = CollectionUpdateDeleteSections()
        update.indexes.insert(index)
        return [update]
    }
}
