import Foundation

extension Landing {
    private var collection:LandingViewCollection? {
        get {
            return self.presenter.outlets.list.viewCollection
        }
    }
    
    func update(editingCard:IndexPath?) {
        self.editingCard = editingCard
        self.reloadViewModel()
    }
    
    func moveCardRight() {
        guard
            let editingCard:IndexPath = self.editingCard
        else {
            return
        }
        let newIndex:IndexPath = IndexPath(item:0, section:editingCard.section + 1)
        self.collection?.moveItem(at:editingCard, to:newIndex)
    }
}
