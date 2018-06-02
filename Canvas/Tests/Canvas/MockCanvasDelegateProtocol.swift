import Foundation
@testable import Shared

class MockCanvasDelegateProtocol:CanvasDelegateProtocol {
    var onEditCardWithIdentifier:(() -> Void)?
    var onEditColumnWithIdentifier:(() -> Void)?
    var onCreateNewCard:(() -> Void)?
    var onCreateNewColumn:(() -> Void)?
    var onSave:(() -> Void)?
    
    func editCardWith(identifier:String) {
        self.onEditCardWithIdentifier?()
    }
    
    func editColumnWith(identifier:String) {
        self.onEditColumnWithIdentifier?()
    }
    
    func createNewCard() {
        self.onCreateNewCard?()
    }
    
    func createNewColumn() {
        self.onCreateNewColumn?()
    }
    
    func saveProject() {
        self.onSave?()
    }
}
