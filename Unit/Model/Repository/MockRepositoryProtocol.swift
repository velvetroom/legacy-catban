import Foundation
@testable import catban

class MockRepositoryProtocol:RepositoryProtocol {
    var onLoadBoard:(() -> Void)?
    var local:RepositoryLocalProtocol
    
    init() {
        self.local = RepositoryLocal()
    }
    
    func loadBoardFromLocal() throws -> BoardProtocol {
        self.onLoadBoard?()
        return Board()
    }
}
