import Foundation
import Tools

extension Interactor:NamerInteractorProtocol {
    public func namerFinishedWith(name:String) {
        
    }
    
    func openNamer() {
        self.state.openNamer(interactor:self)
    }
}
