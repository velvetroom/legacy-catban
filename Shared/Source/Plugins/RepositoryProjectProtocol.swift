import Foundation
import Board

public protocol RepositoryProjectProtocol {
    init()
    func save(project:ProjectProtocol)
    func delete(project:ProjectProtocol)
}
