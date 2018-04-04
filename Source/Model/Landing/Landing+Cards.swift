import UIKit

extension Landing {
    private var collection:LandingViewCollection? {
        get {
            return self.presenter.outlets.list.viewCollection
        }
    }
    
    private var scrollPosition:UICollectionViewScrollPosition {
        get {
            return UICollectionViewScrollPosition([
                UICollectionViewScrollPosition.centeredVertically,
                UICollectionViewScrollPosition.centeredHorizontally])
        }
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
    
    func moveEditingCardRight() {
        guard
            let editingCard:IndexPath = self.editingCard
        else {
            return
        }
        let newIndex:IndexPath = project.indexOnRightForCardAt(index:editingCard)
        self.editingCard = newIndex
        self.moveCardAndCentreFrom(index:editingCard, to:newIndex)
    }
    
    func moveEditingCardLeft() {
        guard
            let editingCard:IndexPath = self.editingCard
        else {
            return
        }
        let newIndex:IndexPath = project.indexOnLeftForCardAt(index:editingCard)
        self.editingCard = newIndex
        self.moveCardAndCentreFrom(index:editingCard, to:newIndex)
    }
    
    func scrollToEditingCard() {
        guard
            let editingCard:IndexPath = self.editingCard
        else {
            return
        }
        self.collection?.scrollToItem(at:editingCard, at:self.scrollPosition, animated:true)
    }
    
    func updateEditingCard(title:String) {
        guard
            let editingCard:IndexPath = self.editingCard
        else {
            return
        }
        self.editingCardReference?.title = title
        self.reloadViewModel()
        self.presenter.updateCardAt(index:editingCard)
    }
    
    private func moveCardAndCentreFrom(index:IndexPath, to destination:IndexPath) {
        self.moveCardFrom(origin:index, to:destination)
        self.collection?.moveItem(at:index, to:destination)
        self.scrollToEditingCard()
    }
}
