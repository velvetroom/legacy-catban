import UIKit

class UpdateDeleteCard:UpdateProtocol {
    var index:IndexPath
    
    init() {
        self.index = IndexPath(item:0, section:0)
    }
    
    func strategy(board:BoardProtocol) {
        board.project.deleteCardAt(indexPath:self.index)
        board.saveProject()
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.deleteItems(at:[self.index])
        collectionView.selectItem(at:nil, animated:true, scrollPosition:UICollectionViewScrollPosition())
    }
}
