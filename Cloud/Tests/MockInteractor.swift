import UIKit
@testable import Cloud

class MockInteractor:Interactor {
    var onStart:(() -> Void)?
    var onSave:(() -> Void)?
    var onGenerateQr:(() -> Void)?
    var error:Error?
    var image:UIImage?
    
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
    
    override func generateQr(onCompletion:@escaping((UIImage) -> Void)) {
        self.onGenerateQr?()
        if let image:UIImage = self.image {
            onCompletion(image)
        }
    }
}
