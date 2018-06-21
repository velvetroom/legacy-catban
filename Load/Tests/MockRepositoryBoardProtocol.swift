import Foundation
import Shared
import Board

class MockRepositoryBoardProtocol:RepositoryBoardProtocol {
    static var board:BoardProtocol = BoardFactory.newBoard()
    static var onLoadBoard:(() -> Void)?
    static var onSaveBoard:((BoardProtocol) -> Void)?
    static var error:Error?
    
    required init() { }
    
    func loadBoard() throws -> BoardProtocol {
        MockRepositoryBoardProtocol.onLoadBoard?()
        
        if let error:Error = MockRepositoryBoardProtocol.error {
            throw error
        }
        
        return MockRepositoryBoardProtocol.board
    }
    
    func save(board:BoardProtocol) {
        MockRepositoryBoardProtocol.onSaveBoard?(board)
    }
}
