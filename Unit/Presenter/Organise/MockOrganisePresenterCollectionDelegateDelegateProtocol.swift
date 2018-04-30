import Foundation
@testable import catban

class MockOrganisePresenterCollectionDelegateDelegateProtocol:OrganisePresenterCollectionDelegateDelegateProtocol {
    var onDelegateSelectCellAtIndex:((IndexPath) -> Void)?
    
    func delegateSelectCellAt(index:IndexPath) {
        self.onDelegateSelectCellAtIndex?(index)
    }
}
