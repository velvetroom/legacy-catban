import Foundation

extension LandingCollectionUpdateFactory {
    func movingItemsFromColumn(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol] {
        if project.columns.count > 1 {
            let host:Int = self.hostColumnForMovingCardsFrom(index:index, in:project)
            return self.updatesMovingFrom(origin:index, to:host, in:project)
        }
        return []
    }
    
    private func hostColumnForMovingCardsFrom(index:Int, in project:ProjectProtocol) -> Int {
        if index > 0 {
            return index - 1
        } else {
            return index + 1
        }
    }
    
    private func updatesMovingFrom(origin:Int, to destination:Int,
                                   in project:ProjectProtocol) -> [CollectionUpdateMoveItem] {
        var updates:[CollectionUpdateMoveItem] = []
        for index:Int in 0 ..< project.columns[origin].cards.count {
            let update:CollectionUpdateMoveItem = CollectionUpdateMoveItem()
            update.origin = IndexPath(item:index, section:origin)
            update.destination = IndexPath(item:index, section:destination)
            updates.append(update)
        }
        return updates
    }
}
