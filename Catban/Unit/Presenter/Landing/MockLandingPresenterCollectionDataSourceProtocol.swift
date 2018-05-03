import Foundation
@testable import catban

class MockLandingPresenterCollectionDataSourceProtocol:LandingPresenterCollectionDataSourceProtocol {
    var onMoveItem:((IndexPath, IndexPath) -> Void)?
    var onDeleteItem:(() -> Void)?
    var onColumnAt:((Int) -> Void)?
    var onEditColumn:((ProjectColumn) -> Void)?
    var returnColumn:ProjectColumn
    
    init() {
        self.returnColumn = ProjectColumn()
    }
    
    func moveItemFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveItem?(origin, destination)
    }
    
    func deleteSelectedItem() {
        self.onDeleteItem?()
    }
    
    func columnAt(index:Int) -> ProjectColumn {
        self.onColumnAt?(index)
        return self.returnColumn
    }
    
    func edit(column:ProjectColumn) {
        self.onEditColumn?(column)
    }
}
