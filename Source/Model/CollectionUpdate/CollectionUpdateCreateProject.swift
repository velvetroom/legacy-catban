import UIKit

class CollectionUpdateCreateProject:CollectionUpdateProtocol {
    var project:ProjectProtocol
    var removeIndexSet:IndexSet
    
    init() {
        self.project = Project()
        self.project.identifier = UUID().uuidString
        self.project.name = String.localizedProject(key:"Project_newProjectName")
        self.removeIndexSet = IndexSet()
    }
    
    func strategy(board:BoardProtocol) {
        self.updateRemoveIndexSetWith(project:board.project)
        self.update(board:board)
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.deleteSections(self.removeIndexSet)
    }
    
    private func updateRemoveIndexSetWith(project:ProjectProtocol) {
        self.removeIndexSet = IndexSet(0 ..< project.columns.count)
    }
    
    private func update(board:BoardProtocol) {
        var board:BoardProtocol = board
        board.insertProject(project:self.project)
        board.project = self.project
    }
}
