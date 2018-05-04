import Foundation
import Board

public protocol RepositoryProjectProtocol {
    func save(project:ProjectProtocol) throws
    func delete(project:ProjectProtocol) throws
}
