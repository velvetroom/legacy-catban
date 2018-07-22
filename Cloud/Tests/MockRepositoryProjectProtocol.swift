import Foundation
import Shared
import Board

class MockRepositoryProjectProtocol:RepositoryProjectProtocol {
    var onLocalSave:(() -> Void)?
    var onRemoteSave:(() -> Void)?
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
    
    func remoteSave(project:ProjectSynchedProtocol, onCompletion:@escaping (() -> Void),
                    onError:@escaping((Error) -> Void)) {
        self.onRemoteSave?()
        if let error:Error = self.error {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async {
                onError(error)
            }
        } else {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async {
                onCompletion()
            }
        }
    }
    
    func localSave(project:ProjectProtocol) {
        self.onLocalSave?()
    }
}
