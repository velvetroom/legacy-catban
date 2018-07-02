import Foundation
import Board

class Remote:RemoteProtocol {
    func makeIdentifier(
        onCompletion:@escaping((String) -> Void),
        onError:@escaping((Error) -> Void)) {
        self.makeIdentifier(onCompletion:onCompletion, onError:onError, retry:0)
    }
    
    func save(project:ProjectSynchedProtocol,
              onCompletion:@escaping(() -> Void),
              onError:@escaping((Error) -> Void)) {
        
    }
    
    private func makeIdentifier(
        onCompletion:@escaping((String) -> Void),
        onError:@escaping((Error) -> Void),
        retry:Int) {
        let identifier:String = self.makeRandomIdentifier()
        self.validateIdentifier(onCompletion: {
            onCompletion(identifier)
        }) { (error:Error) in
            if retry < RepositoryConstants.Remote.maxRetry {
                self.makeIdentifier(onCompletion:onCompletion, onError:onError, retry:retry + 1)
            }
        }
    }
    
    private func makeRandomIdentifier() -> String {
        return UUID().uuidString
    }
    
    private func validateIdentifier(onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void)) {
        onCompletion()
    }
}
