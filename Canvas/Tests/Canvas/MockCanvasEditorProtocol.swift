import Foundation
@testable import Canvas

class MockCanvasEditorProtocol:CanvasEditorProtocol {
    var onEditCardWithIdentifier:(() -> Void)?
    var onCreateNewCard:(() -> Void)?
    
    func editCardWith(identifier:String) {
        self.onEditCardWithIdentifier?()
    }
    
    func createNewCard() {
        self.onCreateNewCard?()
    }
}
