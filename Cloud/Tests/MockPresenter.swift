import Foundation
@testable import Cloud

class MockPresenter:Presenter {
    var onDone:(() -> Void)?
    var onStart:(() -> Void)?
    var onSave:(() -> Void)?
    var onShare:(() -> Void)?
    var onUpdateViewModel:(() -> Void)?
    
    override func done() {
        self.onDone?()
    }
    
    override func start() {
        self.onStart?()
    }
    
    override func save() {
        self.onSave?()
    }
    
    override func share() {
        self.onShare?()
    }
    
    override func updateViewModel() {
        self.onUpdateViewModel?()
    }
}
