import UIKit

class CollectionUpdateCloseProject:CollectionUpdateProtocol {
    var indexSet:IndexSet
    
    init() {
        self.indexSet = IndexSet()
    }
    
    func strategy(board:BoardProtocol) {
        self.indexSet = IndexSet(0 ..< board.project.columns.count)
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.deleteSections(self.indexSet)
    }
}
