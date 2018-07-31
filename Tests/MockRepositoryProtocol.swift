import Foundation
@testable import Domain

class MockRepositoryProtocol:RepositoryProtocol {    
    var error:Error?
    var onSaveSession:(() -> Void)?
    var session:Configuration.SessionType
    var board:Configuration.BoardType
    
    required init() {
        self.session = Configuration.SessionType()
        self.board = Configuration.BoardType()
    }
    
    func load<Model:Decodable>(session:@escaping((Model) -> Void), error:@escaping((Error) -> Void)) {
        if let throwingError:Error = self.error {
            error(throwingError)
        } else {
            session(self.session as! Model)
        }
    }
    
    func load<Model:Decodable>(identifier:String, board:@escaping((Model) -> Void), error:@escaping((Error) -> Void)) {
        if let throwingError:Error = self.error {
            error(throwingError)
        } else {
            board(self.board as! Model)
        }
    }
    
    func save<Model:Encodable>(session:Model) {
        self.onSaveSession?()
    }
}
