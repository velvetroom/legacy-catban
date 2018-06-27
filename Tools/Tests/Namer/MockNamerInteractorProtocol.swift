import Foundation
import CleanArchitecture
import Tools

class MockNamerInteractorProtocol:NamerInteractorProtocol {
    var onNamerFinished:((String) -> Void)?
    var onNamerCancelled:(() -> Void)?
    weak var presenter:InteractorDelegateProtocol?
    
    required init() { }
    
    func namerFinishedWith(name:String) {
        self.onNamerFinished?(name)
    }
    
    func namerCancelled() {
        self.onNamerCancelled?()
    }
}
