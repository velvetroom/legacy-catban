import Foundation
@testable import catban

class MockLandingViewCollection:LandingViewCollection {
    var onReloadDataCalled:(() -> Void)?
    
    override func reloadData() {
        self.onReloadDataCalled?()
    }
}
