import Foundation
@testable import Projects

class MockStateProtocol:StateProtocol {
    var onOpenNamer:(() -> Void)?
    var onNamerFinished:(() -> Void)?
    
    func openNamer(interactor:Interactor) {
        self.onOpenNamer?()
    }
    
    func namerFinishedWith(name:String, interactor:Interactor) {
        self.onNamerFinished?()
    }
}
