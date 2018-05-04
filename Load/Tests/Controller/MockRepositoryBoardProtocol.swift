import Foundation
@testable import Shared
@testable import Board

class MockRepositoryBoardProtocol:RepositoryBoardProtocol {
    var onLoadBoard:(() -> Void)?
    var onSaveBoard:((BoardProtocol) -> Void)?
    var error:Error?
    
    required init() { }
    
    func loadBoard() throws -> BoardProtocol {
        self.onLoadBoard?()
        
        if let error:Error = self.error {
            throw error
        }
        
        return BoardFactory.newBoard()
    }
    
    func save(board:BoardProtocol) throws {
        self.onSaveBoard?(board)
        
        if let error:Error = self.error {
            throw error
        }
    }
}
