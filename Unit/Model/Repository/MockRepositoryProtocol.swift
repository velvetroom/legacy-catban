import Foundation
@testable import catban

class MockRepositoryProtocol:RepositoryProtocol {
    var onLoadBoard:(() -> Void)?
    var local:LocalProtocol
    
    init() {
        self.local = Local()
    }
    
    func loadBoardFromLocal() throws -> BoardProtocol {
        self.onLoadBoard?()
        return Board()
    }
}
