import Foundation

protocol LandingCollectionUpdateFactoryProtocol {
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol]
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [CollectionUpdateProtocol]
    func createColumnIn(project:ProjectProtocol) -> [CollectionUpdateProtocol]
    func createProject() -> [CollectionUpdateProtocol]
    func deleteProject(board:BoardProtocol) throws -> [CollectionUpdateProtocol]
}
