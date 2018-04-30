import Foundation
@testable import catban

class MockLandingPresenterCollectionDelegateProtocol:LandingPresenterCollectionDelegateProtocol {
    var onSelectCell:(() -> Void)?
    var onDeselectCell:(() -> Void)?
    
    func delegateSelectCellAt(index:IndexPath) {
        self.onSelectCell?()
    }
    
    func delegateClearSelection() {
        self.onDeselectCell?()
    }
}
