import Foundation
@testable import catban

class MockRepositoryProtocol:RepositoryProtocol {
    var onLoadBoardFromLocal:(() -> Void)?
    var onLocalSave:((BoardProtocol) -> Void)?
    
    func loadBoardFromLocal() throws -> BoardProtocol {
        self.onLoadBoardFromLocal?()
        return Board()
    }
    
    func localSave(board:BoardProtocol) throws {
        self.onLocalSave?(board)
    }
}
