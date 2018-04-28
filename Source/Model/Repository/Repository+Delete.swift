import Foundation

extension Repository {
    func localDelete(project:ProjectProtocol) throws {
        try self.local.delete(project:project)
    }
}
