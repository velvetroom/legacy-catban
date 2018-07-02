import Foundation
import Board

protocol RemoteProtocol {
    func makeIdentifier(onCompletion:@escaping((String) -> Void), onError:@escaping((Error) -> Void))
    func save(project:ProjectSynchedProtocol, onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void))
}
