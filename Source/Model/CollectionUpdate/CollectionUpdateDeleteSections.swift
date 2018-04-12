import UIKit

class CollectionUpdateDeleteSections:CollectionUpdateProtocol {
    var indexes:IndexSet
    
    init() {
        self.indexes = IndexSet()
    }
    
    func strategy(project:ProjectProtocol) {
        guard
            let index:Int = self.indexes.first
        else {
            return
        }
        project.deleteColumnAt(index:index)
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.deleteSections(self.indexes)
    }
}
