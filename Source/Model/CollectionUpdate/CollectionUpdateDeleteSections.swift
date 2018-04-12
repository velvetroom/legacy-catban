import UIKit

class CollectionUpdateDeleteSections:CollectionUpdateProtocol {
    var index:Int
    
    init() {
        self.index = 0
    }
    
    func strategy(project:ProjectProtocol) {
        project.deleteColumnAt(index:self.index)
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.deleteSections(IndexSet(integer:self.index))
    }
}
