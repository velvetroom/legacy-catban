import Foundation
import Board
@testable import Repository

class MockRemoteProtocol:RemoteProtocol {
    var identifier:String
    var error:Error?
    
    init() {
        self.identifier = String()
    }
    
    func makeIdentifier(onCompletion:@escaping((String) -> Void), onError:@escaping((Error) -> Void)) {
        if let error:Error = self.error {
            onError(error)
        } else {
            onCompletion(self.identifier)
        }
    }
    
    func save(project:ProjectSynchedProtocol, onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void)) {
        if let error:Error = self.error {
            onError(error)
        } else {
            onCompletion()
        }
    }
}
