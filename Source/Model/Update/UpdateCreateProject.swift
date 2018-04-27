import UIKit

class UpdateCreateProject:UpdateProtocol {
    var project:ProjectProtocol
    
    init() {
        self.project = UpdateCreateProject.factoryNewProject()
    }
    
    func strategy(board:BoardProtocol) {
        var board:BoardProtocol = board
        board.insertProject(project:self.project)
        board.project = self.project
    }
    
    func strategy(collectionView:UICollectionView) { }
}
