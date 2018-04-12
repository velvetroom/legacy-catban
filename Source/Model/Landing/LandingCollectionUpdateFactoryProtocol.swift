import Foundation

protocol LandingCollectionUpdateFactoryProtocol {
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol]
    func deleteColumnAt(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol]
}
