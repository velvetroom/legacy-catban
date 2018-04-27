import UIKit

class UpdateOpenProject:UpdateProtocol {
    var indexSet:IndexSet
    
    init() {
        self.indexSet = IndexSet()
    }
    
    func updateIndexWith(project:ProjectProtocol) {
        self.indexSet = IndexSet(0 ..< project.columns.count)
    }
    
    func strategy(board:BoardProtocol) { }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.insertSections(self.indexSet)
    }
}
