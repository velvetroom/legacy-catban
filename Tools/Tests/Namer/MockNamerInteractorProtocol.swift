import Foundation
import Shared
import Tools

class MockNamerInteractorProtocol:NamerInteractorProtocol {
    var onNamerFinished:((String) -> Void)?
    var onNamerCancelled:(() -> Void)?
    weak var presenter:InteractorPresentationProtocol?
    
    required init() { }
    
    func namerFinishedWith(name:String) {
        self.onNamerFinished?(name)
    }
    
    func namerCancelled() {
        self.onNamerCancelled?()
    }
}
