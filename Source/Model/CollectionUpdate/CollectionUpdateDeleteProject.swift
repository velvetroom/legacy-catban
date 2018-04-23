import UIKit

class CollectionUpdateDeleteProject:CollectionUpdateProtocol {
    func strategy(board:BoardProtocol) {
        board.deleteProject()
    }
    
    func strategy(collectionView:UICollectionView) { }
}
