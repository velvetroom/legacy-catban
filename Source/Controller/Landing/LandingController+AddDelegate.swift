import Foundation

extension LandingController:LandingAddControllerDelegateProtocol {
    func createCard() {
        let indexPath:IndexPath = self.model.createCard()
        self.openWriterForCardAt(indexPath:indexPath)
    }
    
    func createColumn() {
        self.model.createColumn()
    }
}
