import UIKit

class CollectionUpdateCreateProject:CollectionUpdateProtocol {
    var project:ProjectProtocol
    
    init() {
        self.project = Project()
        self.project.identifier = UUID().uuidString
    }
    
    func strategy(board:BoardProtocol) {
        var board:BoardProtocol = board
        board.insertProject(project:self.project)
        board.project = self.project
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.reloadData()
    }
}
