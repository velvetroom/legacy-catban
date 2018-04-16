import Foundation
@testable import catban

class MockRepositoryProtocol:RepositoryProtocol {
    var onLoadBoardFromLocal:(() -> Void)?
    var local:RepositoryLocalProtocol
    
    init() {
        self.local = RepositoryLocal()
    }
    
    func loadBoardFromLocal() throws -> BoardProtocol {
        self.onLoadBoardFromLocal?()
        return Board()
    }
}
