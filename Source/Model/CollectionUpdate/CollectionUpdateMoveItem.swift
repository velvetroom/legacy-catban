import UIKit

class CollectionUpdateMoveItem:CollectionUpdateProtocol {
    var origin:IndexPath
    var destination:IndexPath
    
    init() {
        self.origin = IndexPath(item:0, section:0)
        self.destination = IndexPath(item:0, section:0)
    }
    
    func strategy(project:ProjectProtocol) {
        project.moveCardFrom(origin:self.origin, to:self.destination)
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.moveItem(at:self.origin, to:self.destination)
    }
}
