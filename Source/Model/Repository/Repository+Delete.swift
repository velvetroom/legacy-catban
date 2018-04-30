import Foundation

extension Repository {
    func delete(project:ProjectProtocol) throws {
        try self.local.delete(project:project)
    }
}
