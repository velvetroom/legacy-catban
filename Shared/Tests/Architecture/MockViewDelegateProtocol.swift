import UIKit
@testable import Shared

class MockViewDelegateProtocol:ViewDelegateProtocol {
    var onDidLoadView:((UIView) -> Void)?
    
    func didLoad(view:UIView) {
        self.onDidLoadView?(view)
    }
}
