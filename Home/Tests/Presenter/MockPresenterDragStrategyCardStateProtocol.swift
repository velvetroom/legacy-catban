import Foundation
@testable import Home

class MockPresenterDragStrategyCardStateProtocol:PresenterDragStrategyCardStateProtocol {
    var strategy:PresenterDragStrategyCard!
    var onMoved:(() -> Void)?
    var onEndDragging:(() -> Void)?
    
    func moved() {
        self.onMoved?()
    }
    
    func endDragging() {
        self.onEndDragging?()
    }
}
