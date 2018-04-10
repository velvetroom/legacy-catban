import Foundation

extension Landing {
    func columnAt(index:Int) -> ProjectColumn {
        return self.project.columnAt(index:index)
    }
    
    func updateColumnAt(index:Int) {
        self.reloadViewModel()
        self.presenter.updateColumnAt(index:index)
    }
    
    func createColumn() -> Int {
        return 0
        /*
        let card:ProjectCard = ProjectCard()
        let index:IndexPath = self.project.indexForNewCard()
        self.editingCard = index
        self.project.insert(card:card, at:index)
        self.reloadViewModel()
        self.presenter.insertCardAt(index:index)
        self.scrollToEditingCard()*/
    }
    
    func deleteColumnAt(index:Int) {
        self.project.deleteColumnAt(index:index)
        self.reloadViewModel()
        self.presenter.deleteColumnAt(index:index)
    }
}
