import Foundation

protocol UpdateFactoryProtocol {
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) throws -> [UpdateProtocol]
    func deleteColumnAt(index:Int, in project:ProjectProtocol) throws -> [UpdateProtocol]
    func createColumnIn(project:ProjectProtocol) -> [UpdateProtocol]
    func createProject() -> [UpdateProtocol]
    func deleteProject(board:BoardProtocol) throws -> [UpdateProtocol]
}
