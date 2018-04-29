import Foundation

protocol UpdateFactoryProtocol {
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) -> [UpdateProtocol]
    func createCard(indexPath:IndexPath) -> [UpdateProtocol]
    func createColumnIn(project:ProjectProtocol) -> [UpdateProtocol]
    func createProject() -> [UpdateProtocol]
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [UpdateProtocol]
    func deleteProject(board:BoardProtocol) throws -> [UpdateProtocol]
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) throws -> [UpdateProtocol]
}
