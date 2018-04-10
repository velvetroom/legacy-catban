import Foundation

class LandingCollectionUpdateFactory:LandingCollectionUpdateFactoryProtocol {
    func updatesForMovingItemsFromColumn(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        return []
    }
}
