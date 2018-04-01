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
            let project:ProjectProtocol = self.project,
            let editingCard:IndexPath = self.editingCard
        else {
            return
        }
        let newIndex:IndexPath = project.indexOnRightForCardAt(index:editingCard)
        self.moveCardFrom(origin:editingCard, to:newIndex)
        self.collection?.moveItem(at:editingCard, to:newIndex)
    }
    
    func moveEditingCardLeft() {
        guard
            let project:ProjectProtocol = self.project,
            let editingCard:IndexPath = self.editingCard
        else {
            return
        }
        let newIndex:IndexPath = project.indexOnLeftForCardAt(index:editingCard)
        self.moveCardFrom(origin:editingCard, to:newIndex)
        self.collection?.moveItem(at:editingCard, to:newIndex)
    }
}
