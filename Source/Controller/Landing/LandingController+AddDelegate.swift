import Foundation

extension LandingController:LandingAddControllerDelegateProtocol {
    func createCard() {
        self.model.createCard()
        self.openWriterForEditingCard()
    }
    
    func createColumn() {
        
    }
}
