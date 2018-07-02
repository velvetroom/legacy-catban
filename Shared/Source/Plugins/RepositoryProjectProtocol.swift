import Foundation
import Board

public protocol RepositoryProjectProtocol {
    init()
    func localSave(project:ProjectProtocol)
    func localDelete(project:ProjectProtocol)
    func startRemote(project:ProjectProtocol,
                     onCompletion:@escaping((ProjectSynchedProtocol) -> Void),
                     onError:@escaping((Error) -> Void))
}
