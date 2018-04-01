import Foundation
@testable import catban

class MockLandingViewCollection:LandingViewCollection {
    var onReloadDataCalled:(() -> Void)?
    var onMoveItem:((IndexPath, IndexPath) -> Void)?
    var returnNumberOfItemsInSection:Int?
    
    override func reloadData() {
        super.reloadData()
        self.onReloadDataCalled?()
    }
    
    override func numberOfItems(inSection section:Int) -> Int {
        guard
            let items:Int = self.returnNumberOfItemsInSection
        else {
            return super.numberOfItems(inSection:section)
        }
        return items
    }
    
    override func moveItem(at indexPath:IndexPath, to newIndexPath:IndexPath) {
        self.onMoveItem?(indexPath, newIndexPath)
    }
}
