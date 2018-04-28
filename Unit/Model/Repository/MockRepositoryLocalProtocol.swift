import Foundation
@testable import catban

class MockRepositoryLocalProtocol:RepositoryLocalProtocol {
    var onLoadBoard:(() -> Void)?
    var onSaveBoard:((BoardProtocol) -> Void)?
    
    func loadBoard() throws -> BoardProtocol {
        self.onLoadBoard?()
        return Board()
    }
    
    func save(board:BoardProtocol) throws {
        self.onSaveBoard?(board)
    }
}
