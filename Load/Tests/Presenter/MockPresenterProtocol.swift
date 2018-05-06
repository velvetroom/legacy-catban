import UIKit
@testable import Shared

class MockPresenterProtocol:PresenterProtocol {
    var onDidLoadView:((UIView) -> Void)?
    var delegate:PresenterDelegateProtocol?
    
    init() { }
    
    func didLoad(view:UIView) {
        self.onDidLoadView?(view)
    }
}
