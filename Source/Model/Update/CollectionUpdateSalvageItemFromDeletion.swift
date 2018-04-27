import UIKit

class CollectionUpdateSalvageItemFromDeletion:CollectionUpdateProtocol {
    var origin:IndexPath
    var destinationBeforeUpdate:IndexPath
    var destinationAfterUpdate:IndexPath
    
    init() {
        self.origin = IndexPath(item:0, section:0)
        self.destinationBeforeUpdate = IndexPath(item:0, section:0)
        self.destinationAfterUpdate = IndexPath(item:0, section:0)
    }
    
    func strategy(board:BoardProtocol) {
        board.project.moveCardFrom(origin:self.origin, to:self.destinationBeforeUpdate)
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.moveItem(at:self.origin, to:self.destinationAfterUpdate)
    }
}
