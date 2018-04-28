import Foundation

extension RepositoryLocal {
    func delete(project:ProjectProtocol) throws {
        try self.file.deleteProjectWith(identifier:project.identifier)
    }
}
