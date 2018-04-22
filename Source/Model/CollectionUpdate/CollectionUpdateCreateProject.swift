import UIKit

class CollectionUpdateCreateProject:CollectionUpdateProtocol {
    var project:ProjectProtocol
    var removeIndexSet:IndexSet
    var insertIndexSet:IndexSet
    
    init() {
        self.project = CollectionUpdateCreateProject.factoryNewProject()
        self.removeIndexSet = IndexSet()
        self.insertIndexSet = IndexSet()
        self.insertIndexSet = self.indexSetWith(project:self.project)
    }
    
    func strategy(board:BoardProtocol) {
        self.removeIndexSet = self.indexSetWith(project:board.project)
        self.update(board:board)
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.deleteSections(self.removeIndexSet)
        collectionView.insertSections(self.insertIndexSet)
    }
    
    private func indexSetWith(project:ProjectProtocol) -> IndexSet {
        return IndexSet(0 ..< project.columns.count)
    }
    
    private func update(board:BoardProtocol) {
        var board:BoardProtocol = board
        board.insertProject(project:self.project)
        board.project = self.project
    }
}
