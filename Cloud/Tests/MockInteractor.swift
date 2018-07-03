import Foundation
@testable import Cloud

class MockInteractor:Interactor {
    var onStart:(() -> Void)?
    var onSave:(() -> Void)?
    var error:Error?
    
    override func start(onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void)) {
        self.onStart?()
        if let error:Error = self.error {
            onError(error)
        } else {
            onCompletion()
        }
    }
    
    override func save(onCompletion:@escaping(() -> Void), onError:@escaping((Error) -> Void)) {
        self.onSave?()
        if let error:Error = self.error {
            onError(error)
        } else {
            onCompletion()
        }
    }
}
