import UIKit

class UpdateDeleteProject:UpdateProtocol {
    func strategy(board:BoardProtocol) {
        board.deleteProject()
    }
    
    func strategy(collectionView:UICollectionView) { }
}
