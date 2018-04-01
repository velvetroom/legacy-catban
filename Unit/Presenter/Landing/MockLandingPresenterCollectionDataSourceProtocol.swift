import Foundation
@testable import catban

class MockLandingPresenterCollectionDataSourceProtocol:LandingPresenterCollectionDataSourceProtocol {
    var onMoveItem:((IndexPath, IndexPath) -> Void)?
    var onReloadCollection:(() -> Void)?
    
    func moveItemFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveItem?(origin, destination)
    }
    
    func reloadCollection() {
        self.onReloadCollection?()
    }
}
