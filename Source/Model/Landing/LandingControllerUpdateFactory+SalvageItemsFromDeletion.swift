import Foundation

extension LandingCollectionUpdateFactory {
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) -> [CollectionUpdateProtocol] {
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
                                   in project:ProjectProtocol) -> [CollectionUpdateSalvageItemFromDeletion] {
        let hostSize:Int = project.columns[destination].cards.count
        let countItems:Int = project.columns[origin].cards.count
        var updates:[CollectionUpdateSalvageItemFromDeletion] = []
        for index:Int in 0 ..< countItems {
            let removeIndex:Int = countItems - (index + 1)
            let update:CollectionUpdateSalvageItemFromDeletion = CollectionUpdateSalvageItemFromDeletion()
            update.origin = IndexPath(item:removeIndex, section:origin)
            update.destination = IndexPath(item:index + hostSize, section:destination)
            updates.append(update)
        }
        return updates
    }
}
