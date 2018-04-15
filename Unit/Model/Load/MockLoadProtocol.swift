import Foundation
@testable import catban

class MockLoadProtocol:LoadProtocol {
    var onLoadBoard:(() -> Void)?
    
    func loadBoard(completion:@escaping((Board) -> Void)) {
        self.onLoadBoard?()
    }
}
