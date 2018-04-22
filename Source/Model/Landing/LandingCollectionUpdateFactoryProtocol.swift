import Foundation

protocol LandingCollectionUpdateFactoryProtocol {
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol]
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol]
    func insertColumnIn(project:ProjectProtocol) -> [CollectionUpdateProtocol]
    func createProject() -> [CollectionUpdateProtocol]
}
