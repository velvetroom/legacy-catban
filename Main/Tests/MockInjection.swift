import Foundation
@testable import Main

class MockInjection:Injection {
    var onLoad:(() -> Void)?
    
    override func load() {
        self.onLoad?()
    }
}
