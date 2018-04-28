import Foundation

protocol BoardRepositoryProtocol {
    func delete(project:ProjectProtocol)
    func save(project:ProjectProtocol)
    func save(user:UserProtocol)
}
