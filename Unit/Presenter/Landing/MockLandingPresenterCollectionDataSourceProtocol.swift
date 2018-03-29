import Foundation
@testable import catban

class MockLandingPresenterCollectionDataSourceProtocol:LandingPresenterCollectionDataSourceProtocol {
    var onReorderItem:((Int, Int, Int) -> Void)?
    var onReloadCollection:(() -> Void)?
    
    func reorderItemFrom(index:Int, to destination:Int, in section:Int) {
        self.onReorderItem?(index, destination, section)
    }
    
    func reloadCollection() {
        self.onReloadCollection?()
    }
}
