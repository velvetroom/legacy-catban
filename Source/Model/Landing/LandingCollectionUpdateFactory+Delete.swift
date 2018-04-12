import Foundation

extension LandingCollectionUpdateFactory {
    func deleteColumnAt(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        let update:CollectionUpdateDeleteSections = CollectionUpdateDeleteSections()
        update.index = index
        return [update]
    }
}
