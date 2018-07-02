import Foundation
import Board

public protocol RepositoryProjectProtocol {
    init()
    func localSave(project:ProjectProtocol)
    func localDelete(project:ProjectProtocol)
}
