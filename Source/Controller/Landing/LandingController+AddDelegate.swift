import Foundation

extension LandingController:LandingAddControllerDelegateProtocol {
    func createCard() {
        let card:ProjectCard = self.model.createCard()
        self.openWriterForCard(card:card)
    }
    
    func createColumn() {
        self.model.createColumn()
    }
}
