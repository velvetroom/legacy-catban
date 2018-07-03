import Foundation
@testable import Cloud

class MockInteractor:Interactor {
    var onStart:(() -> Void)?
    var error:Error?
    
    override func start(onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void)) {
        self.onStart?()
        if let error:Error = self.error {
            onError(error)
        } else {
            onCompletion()
        }
    }
}
