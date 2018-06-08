import Foundation
@testable import Shared

class MockViewDelegateProtocol:ViewDelegateProtocol {
    var onDidLoad:(() -> Void)?
    var onDidAppear:(() -> Void)?
    
    func didLoad(view:View) {
        self.onDidLoad?()
    }
    
    func didAppear(view:View) {
        self.onDidAppear?()
    }
}
