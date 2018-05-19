import UIKit
@testable import Canvas

class MockMapDelegateProtocol:MapDelegateProtocol {
    var onMapChangedSize:(() -> Void)?
    
    func mapChanged(size:CGSize) {
        self.onMapChangedSize?()
    }
}
