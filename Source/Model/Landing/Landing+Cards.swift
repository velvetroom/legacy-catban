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
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.project?.moveCardFrom(origin:origin, to:destination)
        self.reloadViewModel()
    }
    
    func moveEditingCardRight() {
        guard
            let editingCard:IndexPath = self.editingCard
        else {
            return
        }
        let newIndex:IndexPath = IndexPath(item:0, section:editingCard.section + 1)
        self.collection?.moveItem(at:editingCard, to:newIndex)
    }
}
