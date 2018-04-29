import UIKit

class UpdateDeleteColumn:UpdateProtocol {
    var index:Int
    
    init() {
        self.index = 0
    }
    
    func strategy(board:BoardProtocol) {
        board.project.deleteColumnAt(index:self.index)
        board.saveProject()
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.deleteSections(IndexSet(integer:self.index))
    }
}
