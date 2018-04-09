import Foundation
@testable import catban

class MockLandingPresenterCollectionDataSourceProtocol:LandingPresenterCollectionDataSourceProtocol {
    var onMoveItem:((IndexPath, IndexPath) -> Void)?
    var onDeleteItem:((IndexPath) -> Void)?
    var onEditHeader:((Int) -> Void)?
    
    func moveItemFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveItem?(origin, destination)
    }
    
    func deleteItemAt(indexPath:IndexPath) {
        self.onDeleteItem?(indexPath)
    }
    
    func editHeaderAt(index:Int) {
        self.onEditHeader?(index)
    }
}
