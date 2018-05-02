import Foundation

extension Landing {
    func clearCardSelection() {
        self.collection?.clearSelection()
        self.stateStandby()
    }
    
    func cardAt(indexPath:IndexPath) -> ProjectCard {
        return self.project.cardAt(indexPath:indexPath)
    }
    
    func deleteCardAt(indexPath:IndexPath) {
        self.stateStandby()
        let updates:[UpdateProtocol] = self.update.deleteCardAt(index:indexPath)
        self.applyUpdates(updates:updates)
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.editingCard = destination
        let updates:[UpdateProtocol] = self.update.moveCardFrom(origin:origin, to:destination)
        self.applyUpdates(updates:updates)
        self.scrollToEditingCard()
    }
    
    func updateCard(title:String) {
        guard
            let indexPath:IndexPath = self.editingCard
        else { return }
        self.editingCardReference?.title = title
        self.reloadViewModel()
        self.presenter.updateCardAt(index:indexPath)
        self.board.saveProject()
    }
    
    func createCard() {
        let indexPath:IndexPath = self.project.indexForNewCard()
        self.editingCard = indexPath
        let updates:[UpdateProtocol] = self.update.createCard(indexPath:indexPath)
        self.applyUpdates(updates:updates)
        self.scrollToEditingCard()
    }
}
