import UIKit

class CollectionUpdateInsertSections:CollectionUpdateProtocol {
    var column:ProjectColumn
    var section:Int
    
    init() {
        self.column = ProjectColumn()
        self.section = 0
    }
    
    func strategy(project:ProjectProtocol) {
        project.insert(column:self.column, at:self.section)
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.insertSections(IndexSet(integer:self.section))
    }
}
