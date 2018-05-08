import UIKit
@testable import Shared

class MockPresenterProtocol:PresenterProtocol {
    var onShouldUpdate:(() -> Void)?
    var delegate:PresenterDelegateProtocol?
    
    func shouldUpdate() {
        self.onShouldUpdate?()
    }
}
