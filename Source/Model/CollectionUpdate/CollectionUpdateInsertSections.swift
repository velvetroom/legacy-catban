import UIKit

class CollectionUpdateInsertSections:CollectionUpdateProtocol {
    var column:ProjectColumn
    var section:Int
    
    init() {
        self.section = 0
        self.column = ProjectColumn()
        self.column.identifier = UUID().uuidString
    }
    
    func strategy(project:ProjectProtocol) {
        project.insert(column:self.column, at:self.section)
    }
    
    func strategy(collectionView:UICollectionView) {
        collectionView.insertSections(IndexSet(integer:self.section))
    }
}
