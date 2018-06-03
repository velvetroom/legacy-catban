import Foundation
@testable import Shared

class MockViewDelegateProtocol:ViewDelegateProtocol {
    var onDidLoadView:((View) -> Void)?
    var onDidAppear:((View) -> Void)?
    
    func didLoad(view:View) {
        self.onDidLoadView?(view)
    }
    
    func didAppear(view:View) {
        self.onDidAppear?(view)
    }
}
