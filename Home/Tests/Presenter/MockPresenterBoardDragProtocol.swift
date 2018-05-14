import UIKit
@testable import Home

class MockPresenterBoardDragProtocol:PresenterBoardDragProtocol {
    var onUpdated:((PresenterBoardDragState, CGPoint) -> Void)?
    
    func updated(state:PresenterBoardDragState, at position:CGPoint) {
        self.onUpdated?(state, position)
    }
}
