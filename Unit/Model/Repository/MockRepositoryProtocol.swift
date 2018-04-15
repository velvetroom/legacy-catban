import Foundation
@testable import catban

class MockRepositoryProtocol:RepositoryProtocol {
    var onLoadBoard:(() -> Void)?
    
    func loadBoard() throws -> BoardProtocol {
        self.onLoadBoard?()
        return Board()
    }
}
