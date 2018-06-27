import Foundation
@testable import Projects

class MockStateProtocol:StateProtocol {
    var onOpenNamer:(() -> Void)?
    var onNamerFinished:(() -> Void)?
    var onDeleteConfirmed:(() -> Void)?
    var onOpenDeleter:(() -> Void)?
    
    func deleterConfirmed(interactor:Interactor) {
        self.onDeleteConfirmed?()
    }
    
    func openNamer(interactor:Interactor) {
        self.onOpenNamer?()
    }
    
    func namerFinishedWith(name:String, interactor:Interactor) {
        self.onNamerFinished?()
    }
    
    func openDeleter(interactor:Interactor) {
        self.onOpenDeleter?()
    }
}
