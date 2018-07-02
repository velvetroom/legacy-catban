import Foundation
import Board

public extension Repository {
    public func startRemote(project:ProjectProtocol,
                            onCompletion:@escaping((ProjectSynchedProtocol) -> Void),
                            onError:@escaping((Error) -> Void)) {
        self.dispatchQueue.async {
            self.backgroundStart(project:project, onCompletion:onCompletion, onError:onError)
        }
    }
    
    public func remoteSave(project:ProjectSynchedProtocol,
                           onCompletion:@escaping(() -> Void),
                           onError:@escaping((Error) -> Void)) {
        self.dispatchQueue.async {
            self.backgroundSave(project:project, onCompletion:onCompletion, onError:onError)
        }
    }
    
    private func backgroundStart(project:ProjectProtocol,
                                 onCompletion:@escaping((ProjectSynchedProtocol) -> Void),
                                 onError:@escaping((Error) -> Void)) {
        self.remote.makeIdentifier(onCompletion: { (identifier:String) in
            self.remoteStarted(project:project, with:identifier, onCompletion:onCompletion, onError:onError)
        }, onError:onError)
    }
    
    private func remoteStarted(project:ProjectProtocol, with remoteIdentifier:String,
                               onCompletion:@escaping((ProjectSynchedProtocol) -> Void),
                               onError:@escaping((Error) -> Void)) {
        var project:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        project.remoteIdentifier = remoteIdentifier
        self.backgroundSave(project:project, onCompletion: {
            onCompletion(project)
        }, onError:onError)
    }
    
    private func backgroundSave(project:ProjectSynchedProtocol,
                                onCompletion:@escaping(() -> Void),
                                onError:@escaping((Error) -> Void)) {
        self.remote.save(project:project, onCompletion:onCompletion, onError:onError)
    }
    
    private func makeSynchedWith(project:ProjectProtocol, and remoteIdentifier:String) -> ProjectSynchedProtocol {
        var synched:ProjectSynchedProtocol = ProjectFactory.makeSynchable(project:project)
        synched.remoteIdentifier = remoteIdentifier
        return synched
    }
}
