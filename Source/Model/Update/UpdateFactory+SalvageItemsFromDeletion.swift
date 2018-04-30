import Foundation

extension UpdateFactory {
    func salvageItemsFromColumn(index:Int, in project:ProjectProtocol) throws -> [UpdateProtocol] {
        guard
            project.columns.count > 1
        else { throw ErrorProject.oneColumnMinimum }
        return self.updatesMovingFrom(origin:index, in:project)
    }
    
    private func hostColumnForMovingCardsFrom(index:Int, in project:ProjectProtocol) -> Int {
        if index > 0 {
            return index - 1
        } else {
            return index + 1
        }
    }
    
    private func columnDestinationAfterUpdateFrom(index:Int) -> Int {
        if index > 0 {
            return index - 1
        } else {
            return 0
        }
    }
    
    private func updatesMovingFrom(origin:Int,
                                   in project:ProjectProtocol) -> [UpdateSalvageItemFromDeletion] {
        let destination:Int = self.hostColumnForMovingCardsFrom(index:origin, in:project)
        let destinationAfterUpdate:Int = self.columnDestinationAfterUpdateFrom(index:origin)
        let hostSize:Int = project.columns[destination].cards.count
        let countItems:Int = project.columns[origin].cards.count
        var updates:[UpdateSalvageItemFromDeletion] = []
        for index:Int in 0 ..< countItems {
            let removeIndex:Int = countItems - (index + 1)
            let update:UpdateSalvageItemFromDeletion = UpdateSalvageItemFromDeletion()
            update.origin = IndexPath(item:removeIndex, section:origin)
            update.destinationBeforeUpdate = IndexPath(item:index + hostSize, section:destination)
            update.destinationAfterUpdate = IndexPath(item:index + hostSize, section:destinationAfterUpdate)
            updates.append(update)
        }
        return updates
    }
}
