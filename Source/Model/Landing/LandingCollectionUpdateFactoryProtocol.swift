import Foundation

protocol LandingCollectionUpdateFactoryProtocol {
    func updatesForMovingItemsFromColumn(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol]
}
