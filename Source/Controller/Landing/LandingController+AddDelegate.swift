import Foundation

extension LandingController:LandingControllerAddDelegateProtocol {
    func createCard() {
        self.model.createCard()
    }
}
