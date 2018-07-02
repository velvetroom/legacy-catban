import Foundation
import Shared
import Board

class MockRepositoryProjectProtocol:RepositoryProjectProtocol {
    var error:Error?
    
    required init() { }
    
    func startRemote(project:ProjectProtocol, onCompletion:@escaping((ProjectSynchedProtocol) -> Void),
                     onError:@escaping((Error) -> Void)) {
        if let error:Error = self.error {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async {
                onError(error)
            }
        } else {
            let synched:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async {
                onCompletion(synched)
            }
        }
    }
}
