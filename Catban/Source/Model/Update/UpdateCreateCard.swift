import UIKit

class UpdateCreateCard:UpdateProtocol {
    var card:ProjectCard
    var indexPath:IndexPath
    
    init() {
        self.card = ProjectCard.factoryCard()
        self.indexPath = IndexPath(item:0, section:0)
    }
    
    func strategy(board:BoardProtocol) {
        board.project.insert(card:self.card, at:self.indexPath)
        board.project.history.created(card:self.card)
        board.saveProject()
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.insertItems(at:[self.indexPath])
    }
}
