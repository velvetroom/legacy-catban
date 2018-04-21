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
    
    func createColumn() {
        let updates:[CollectionUpdateProtocol] = self.collectionUpdateFactory.insertColumnIn(project:self.project)
        self.project.apply(updates:updates)
        self.reloadViewModel()
        self.presenter.apply(updates:updates)
    }
    
    func deleteColumnAndMoveCardsAt(index:Int) throws {
        let updates:[CollectionUpdateProtocol] = try self.updatesForDeleteColumnAt(index:index)
        self.project.apply(updates:updates)
        self.reloadViewModel()
        self.presenter.apply(updates:updates)
    }
    
    func updatesForDeleteColumnAt(index:Int) throws -> [CollectionUpdateProtocol] {
        var updates:[CollectionUpdateProtocol] = []
        let moveUpdates:[CollectionUpdateProtocol] = try self.collectionUpdateFactory.salvageItemsFromColumn(
            index:index, in:self.project)
        let deleteUpdates:[CollectionUpdateProtocol] = try self.collectionUpdateFactory.deleteColumnAt(
            index:index, in:self.project)
        updates.append(contentsOf:moveUpdates)
        updates.append(contentsOf:deleteUpdates)
        return updates
    }
}
