import Foundation

extension Landing {
    func columnAt(index:Int) -> ProjectColumn {
        return self.project.columnAt(index:index)
    }
    
    func indexFor(column:ProjectColumn) -> Int {
        return self.project.indexFor(column:column)
    }
    
    func updateColumnAt(index:Int) {
        self.reloadViewModel()
        self.presenter.updateColumnAt(index:index)
    }
    
    func createColumn() -> Int {
        let updates:[CollectionUpdateProtocol] = self.self.collectionUpdateFactory.insertColumnIn(
            project:self.project)
        guard
            let update:CollectionUpdateInsertSections = updates.first as? CollectionUpdateInsertSections
        else {
            return 0
        }
        return update.section
        /*
        let card:ProjectCard = ProjectCard()
        let index:IndexPath = self.project.indexForNewCard()
        self.editingCard = index
        self.project.insert(card:card, at:index)
        self.reloadViewModel()
        self.presenter.insertCardAt(index:index)
        self.scrollToEditingCard()*/
    }
    
    func deleteColumnAndMoveCardsAt(index:Int) {
        let updates:[CollectionUpdateProtocol] = self.updatesForDeleteColumnAt(index:index)
        self.project.apply(updates:updates)
        self.reloadViewModel()
        self.presenter.apply(updates:updates)
    }
    
    func updatesForDeleteColumnAt(index:Int) -> [CollectionUpdateProtocol] {
        var updates:[CollectionUpdateProtocol] = []
        let moveUpdates:[CollectionUpdateProtocol] = self.collectionUpdateFactory.salvageItemsFromColumn(
            index:index, in:self.project)
        let deleteUpdates:[CollectionUpdateProtocol] = self.collectionUpdateFactory.deleteColumnAt(
            index:index, in:self.project)
        updates.append(contentsOf:moveUpdates)
        updates.append(contentsOf:deleteUpdates)
        return updates
    }
}
