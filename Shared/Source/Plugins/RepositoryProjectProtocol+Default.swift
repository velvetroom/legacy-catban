import Foundation
import Board

public extension RepositoryProjectProtocol {
    func localSave(project:ProjectProtocol) { }
    func localDelete(project:ProjectProtocol) { }
    func startRemote(project:ProjectProtocol,
                     onCompletion:@escaping((ProjectSynchedProtocol) -> Void),
                     onError:@escaping((Error) -> Void)) { }
    func remoteSave(project:ProjectSynchedProtocol,
                    onCompletion:@escaping(() -> Void),
                    onError:@escaping((Error) -> Void)) { }
}
