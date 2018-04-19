import Foundation
@testable import catban

class MockRepositoryLocalProtocol:RepositoryLocalProtocol {
    var onLoadBoard:(() -> Void)?
    var onSaveBoard:((BoardProtocol) -> Void)?
    var file:FileProtocol
    var deserialiser:DeserialiserProtocol
    var serialiser:SerialiserProtocol
    
    init() {
        self.file = File()
        self.deserialiser = Deserialiser()
        self.serialiser = Serialiser()
    }
    
    func loadBoard() throws -> BoardProtocol {
        self.onLoadBoard?()
        return Board()
    }
    
    func save(board:BoardProtocol) throws {
        self.onSaveBoard?(board)
    }
}
