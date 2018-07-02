import Foundation
import Board

public extension Repository {
    public func startRemote(project:ProjectProtocol,
                            onCompletion:@escaping((ProjectSynchedProtocol) -> Void),
                            onError:@escaping((Error) -> Void)) {
        self.dispatchQueue.async {
            
        }
    }
    
    private func backgroundStartRemote(project:ProjectProtocol,
                                       completion:@escaping((ProjectSynchedProtocol) -> Void),
                                       error:@escaping((Error) -> Void)) {
        error(ErrorRepository.alreadyClouded)
    }
}
