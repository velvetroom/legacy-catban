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
    
    func reorderItemFrom(index:Int, to destination:Int, in section:Int) {
        self.project?.move(cardIndex:index, to:destination, in:section)
        self.reloadViewModel()
    }
    
    func moveEditinCardRight() {
        guard
            let editingCard:IndexPath = self.editingCard
        else {
            return
        }
        let newIndex:IndexPath = IndexPath(item:0, section:editingCard.section + 1)
        self.collection?.moveItem(at:editingCard, to:newIndex)
    }
}
