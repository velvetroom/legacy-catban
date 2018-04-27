import UIKit

class UpdateDeleteSections:UpdateProtocol {
    var index:Int
    
    init() {
        self.index = 0
    }
    
    func strategy(board:BoardProtocol) {
        board.project.deleteColumnAt(index:self.index)
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.deleteSections(IndexSet(integer:self.index))
    }
}
