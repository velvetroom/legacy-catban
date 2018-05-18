import Foundation
@testable import Shared

class MockViewDelegateProtocol:ViewDelegateProtocol {
    var onDidLoadView:((View) -> Void)?
    
    func didLoad(view:View) {
        self.onDidLoadView?(view)
    }
}
