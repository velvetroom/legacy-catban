import UIKit

extension Landing {
    private var collection:LandingViewCollection? {
        get {
            return self.presenter.outlets.list.viewCollection
        }
    }
    
    func clearCardSelection() {
        self.collection?.clearSelection()
        self.update(editingCard:nil)
    }
    
    func cardAt(indexPath:IndexPath) -> ProjectCard {
        return self.project.cardAt(indexPath:indexPath)
    }
    
    func update(editingCard:IndexPath?) {
        self.editingCard = editingCard
        self.reloadViewModel()
        self.scrollToEditingCard()
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.project.moveCardFrom(origin:origin, to:destination)
        self.reloadViewModel()
    }
    
    func deleteEditingCard() {
        guard
            let editingCard:IndexPath = self.editingCard
        else { return }
        self.project.deleteCardAt(indexPath:editingCard)
        self.clearCardSelection()
        self.presenter.deleteCardAt(index:editingCard)
    }
    
    func moveEditingCardRight() {
        guard
            let editingCard:IndexPath = self.editingCard
        else { return }
        let newIndex:IndexPath = self.project.indexOnRightForCardAt(index:editingCard)
        self.editingCard = newIndex
        self.moveCardAndCentreFrom(index:editingCard, to:newIndex)
    }
    
    func moveEditingCardLeft() {
        guard
            let editingCard:IndexPath = self.editingCard
        else { return }
        let newIndex:IndexPath = self.project.indexOnLeftForCardAt(index:editingCard)
        self.editingCard = newIndex
        self.moveCardAndCentreFrom(index:editingCard, to:newIndex)
    }
    
    func updateCardAt(indexPath:IndexPath) {
        self.reloadViewModel()
        self.presenter.updateCardAt(index:indexPath)
    }
    
    func createCard() {
        let indexPath:IndexPath = self.project.indexForNewCard()
        self.editingCard = indexPath
        let updates:[UpdateProtocol] = self.update.createCard(indexPath:indexPath)
        self.board.apply(updates:updates)
        self.reloadViewModel()
        self.presenter.apply(updates:updates)
        self.scrollToEditingCard()
    }
    
    private func moveCardAndCentreFrom(index:IndexPath, to destination:IndexPath) {
        self.moveCardFrom(origin:index, to:destination)
        self.collection?.moveItem(at:index, to:destination)
        self.scrollToEditingCard()
    }
}
