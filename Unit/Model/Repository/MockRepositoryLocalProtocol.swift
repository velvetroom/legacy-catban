import Foundation
@testable import catban

class MockRepositoryLocalProtocol:RepositoryLocalProtocol {
    var onLoadBoard:(() -> Void)?
    
    func loadBoard() throws -> BoardProtocol {
        self.onLoadBoard?()
        return Board()
    }
}
