import Foundation
@testable import Home
@testable import Board

class MockController:Controller {
    var onEditCardWith:((String) -> Void)?
    var onCreateNewCard:(() -> Void)?
    var onOpenProjects:(() -> Void)?
    
    override func editCardWith(identifier:String) {
        self.onEditCardWith?(identifier)
    }
    
    override func createNewCard() {
        self.onCreateNewCard?()
    }
    
    override func openProjects() {
        self.onOpenProjects?()
    }
}
