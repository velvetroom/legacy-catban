import Foundation
@testable import Shared

class MockPresenterProtocol:PresenterProtocol {
    var onDidLoadView:((View) -> Void)?
    var delegate:PresenterDelegateProtocol!
    
    init() { }
    
    func didLoad(view:View) {
        self.onDidLoadView?(view)
    }
}
