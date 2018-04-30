import UIKit

class UpdateCreateColumn:UpdateProtocol {
    var column:ProjectColumn
    var section:Int
    
    init() {
        self.section = 0
        self.column = ProjectColumn.factoryColumn()
    }
    
    func strategy(board:BoardProtocol) {
        board.project.insert(column:self.column, at:self.section)
        board.saveProject()
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.insertSections(IndexSet(integer:self.section))
    }
}
