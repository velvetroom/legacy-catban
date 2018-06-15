import Foundation
import Tools

extension Interactor:NamerInteractorProtocol {
    public func namerFinishedWith(name:String) {
        
    }
    
    public func namerCancelled() {
        
    }
    
    func openNamer() {
        self.state.openNamer(interactor:self)
    }
}
