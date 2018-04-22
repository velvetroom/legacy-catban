import Foundation

extension LandingController:LandingAddControllerDelegateProtocol {
    func createCard() {
        let indexPath:IndexPath = self.model.createCard()
        self.openWriterForCardAt(indexPath:indexPath)
    }
    
    func createColumn() {
        self.model.createColumn()
        self.scheduleScrollToTopRightCorner()
    }
    
    func createProject() {
        self.model.createProject()
    }
    
    private func scheduleScrollToTopRightCorner() {
        DispatchQueue.main.asyncAfter(deadline:
            DispatchTime.now() + LandingViewModel.Constants.waitBeforeScrolling) { [weak self] in
            self?.model.scrollToTopRightCorner()
        }
    }
}
