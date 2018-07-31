import Foundation
@testable import Domain

class MockRepositoryProtocol:RepositoryProtocol {
    var error:Error?
    var onSaveSession:(() -> Void)?
    var session:Configuration.SessionType
    var boards:[Data]
    
    required init() {
        self.session = Configuration.SessionType()
        self.boards = []
    }
    
    func load<Model:Decodable>(session:@escaping((Model) -> Void), error:@escaping((Error) -> Void)) {
        if let throwingError:Error = self.error {
            error(throwingError)
        } else {
            session(self.session as! Model)
        }
    }
    
    func loadBoards(identifiers:[String]) throws -> [Data] {
        if let error:Error = self.error {
            throw error
        }
        return self.boards
    }
    
    func save<Model:Encodable>(session:Model) {
        self.onSaveSession?()
    }
}
