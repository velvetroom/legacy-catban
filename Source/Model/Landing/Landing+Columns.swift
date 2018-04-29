import Foundation

extension Landing {
    func columnAt(index:Int) -> ProjectColumn {
        return self.project.columnAt(index:index)
    }
    
    func indexFor(column:ProjectColumn) -> Int {
        return self.project.indexFor(column:column)
    }
    
    func updateColumnAt(index:Int, with name:String) {
        self.project.columnAt(index:index).name = name
        self.reloadViewModel()
        self.presenter.updateColumnAt(index:index)
        self.board.saveProject()
    }
    
    func createColumn() {
        let updates:[UpdateProtocol] = self.update.createColumnIn(project:self.project)
        self.applyUpdates(updates:updates)
    }
    
    func deleteColumnAndMoveCardsAt(index:Int) throws {
        let updates:[UpdateProtocol] = try self.updatesForDeleteColumnAt(index:index)
        self.applyUpdates(updates:updates)
    }
    
    func updatesForDeleteColumnAt(index:Int) throws -> [UpdateProtocol] {
        var updates:[UpdateProtocol] = []
        let moveUpdates:[UpdateProtocol] = try self.update.salvageItemsFromColumn(
            index:index, in:self.project)
        let deleteUpdates:[UpdateProtocol] = try self.update.deleteColumnAt(
            index:index, in:self.project)
        updates.append(contentsOf:moveUpdates)
        updates.append(contentsOf:deleteUpdates)
        return updates
    }
}
