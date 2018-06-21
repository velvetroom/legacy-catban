import Foundation
import Tools

extension Interactor:NamerInteractorProtocol {
    public func namerFinishedWith(name:String) {
        self.state.namerFinishedWith(name:name, interactor:self)
    }
    
    public func namerCancelled() {
        self.stateDefault()
    }
    
    func openNamer() {
        self.state.openNamer(interactor:self)
    }
}
