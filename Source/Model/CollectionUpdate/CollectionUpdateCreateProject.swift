import UIKit

class CollectionUpdateCreateProject:CollectionUpdateProtocol {
    var project:ProjectProtocol
    
    init() {
        self.project = Project()
        self.project.identifier = UUID().uuidString
    }
    
    func strategy(board:BoardProtocol) {
//        project.deleteColumnAt(index:self.index)
    }
    
    func strategy(collectionView:UICollectionView) {
//        collectionView.deleteSections(IndexSet(integer:self.index))
    }
}
