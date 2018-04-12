import UIKit

class CollectionUpdateInsertSections:CollectionUpdateProtocol {
    var column:ProjectColumn
    var sections:IndexSet
    
    init() {
        self.column = ProjectColumn()
        self.sections = IndexSet()
    }
    
    func strategy(project:ProjectProtocol) {
        
    }
    
    func strategy(collectionView:UICollectionView) {
        
    }
}
