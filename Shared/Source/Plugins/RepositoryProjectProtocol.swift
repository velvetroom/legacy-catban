import Foundation
import Board

public protocol RepositoryProjectProtocol {
    init()
    func save(project:ProjectProtocol) throws
    func delete(project:ProjectProtocol) throws
}
