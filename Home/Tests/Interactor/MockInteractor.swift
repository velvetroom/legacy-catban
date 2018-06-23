import Foundation
import Board
@testable import Home

class MockInteractor:Interactor {
    var onEditCardWith:((String) -> Void)?
    var onCreateNewCard:(() -> Void)?
    var onOpenProjects:(() -> Void)?
    var onClosedMenu:(() -> Void)?
    
    override func editCardWith(identifier:String) {
        self.onEditCardWith?(identifier)
    }
    
    override func createNewCard() {
        self.onCreateNewCard?()
    }
    
    override func openProjects() {
        self.onOpenProjects?()
    }
    
    override func closedMenu() {
        self.onClosedMenu?()
    }
}
