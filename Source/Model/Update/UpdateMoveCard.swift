import UIKit

class UpdateMoveCard:UpdateProtocol {
    var origin:IndexPath
    var destination:IndexPath
    
    init() {
        self.origin = IndexPath(item:0, section:0)
        self.destination = IndexPath(item:0, section:0)
    }
    
    func strategy(board:BoardProtocol) {
        let card:ProjectCard = board.project.cardAt(indexPath:self.origin)
        let column:ProjectColumn = board.project.columnAt(indexPath:self.destination)
        board.project.moveCardFrom(origin:self.origin, to:self.destination)
        board.project.history.moved(card:card, to:column)
        board.saveProject()
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.moveItem(at:self.origin, to:self.destination)
    }
}

