import Foundation
@testable import catban

class MockRepositoryLocalProtocol:RepositoryLocalProtocol {
    var onLoadBoard:(() -> Void)?
    var file:FileProtocol
    var deserialiser:DeserialiserProtocol
    
    init() {
        self.file = File()
        self.deserialiser = Deserialiser()
    }
    
    func loadBoard() throws -> BoardProtocol {
        self.onLoadBoard?()
        return Board()
    }
}
