import UIKit
@testable import Shared
@testable import Home

class MockPresenterProtocol:PresenterProtocol {
    var onShouldUpdate:(() -> Void)?
    var delegate:PresenterDelegateProtocol!
    
    func shouldUpdate() {
        self.onShouldUpdate?()
    }
}
