import Foundation
@testable import Shared
@testable import Board

class MockRepositoryBoardProtocol:RepositoryBoardProtocol {
    static var board:BoardProtocol = BoardFactory.newBoard()
    var onLoadBoard:(() -> Void)?
    var onSaveBoard:((BoardProtocol) -> Void)?
    var error:Error?
    
    required init() { }
    
    func loadBoard() throws -> BoardProtocol {
        self.onLoadBoard?()
        
        if let error:Error = self.error {
            throw error
        }
        
        return MockRepositoryBoardProtocol.board
    }
    
    func save(board:BoardProtocol) {
        self.onSaveBoard?(board)
    }
}
