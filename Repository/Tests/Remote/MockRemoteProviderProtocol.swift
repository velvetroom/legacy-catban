import Foundation
import Shared

class MockRemoteProviderProtocol:RemoteProviderProtocol {
    static var error:Error?
    
    required init() { }
    
    func save(data:Data, identifier:String, onCompletion:@escaping(() -> ()), onError:@escaping((Error) -> Void)) {
        if let error:Error = MockRemoteProviderProtocol.error {
            onError(error)
        } else {
            onCompletion()
        }
    }
}
