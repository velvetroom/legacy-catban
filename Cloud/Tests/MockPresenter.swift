import Foundation
@testable import Cloud

class MockPresenter:Presenter {
    var onDone:(() -> Void)?
    var onStart:(() -> Void)?
    var onUpdateViewModel:(() -> Void)?
    
    override func done() {
        self.onDone?()
    }
    
    override func start() {
        self.onStart?()
    }
    
    override func updateViewModel() {
        self.onUpdateViewModel?()
    }
}
