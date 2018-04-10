import Foundation

protocol LandingCollectionUpdateFactoryProtocol {
    func movingItemsFromColumn(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol]
}
