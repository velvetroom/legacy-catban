import Foundation
@testable import catban

class MockLoadProtocol:LoadProtocol {
    var onLoadBoard:(() -> Void)?
    
    required init() { }
    
    func loadBoard(completion:@escaping((BoardProtocol) -> Void)) {
        self.onLoadBoard?()
    }
}
