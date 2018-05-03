import Foundation
@testable import Shared

class MockViewDelegateProtocol:ViewDelegateProtocol {
    var onViewDidLoad:(() -> Void)?
    
    func viewDidLoad() {
        self.onViewDidLoad?()
    }
}
