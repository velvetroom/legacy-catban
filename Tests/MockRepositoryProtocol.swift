import Foundation
@testable import Domain

class MockRepositoryProtocol:RepositoryProtocol {
    var error:Error?
    var onSaveSession:(() -> Void)?
    var onSaveBoard:(() -> Void)?
    var session:Configuration.Session
    var board:Configuration.Board
    
    required init() {
        self.session = Configuration.Session()
        self.board = Configuration.Board()
    }
    
    func loadLocal<Model:Decodable>(session:@escaping((Model) -> Void), error:@escaping((Error) -> Void)) {
        if let throwingError:Error = self.error {
            error(throwingError)
        } else {
            session(self.session as! Model)
        }
    }
    
    func loadLocal<Model:Decodable>(identifier:String, board:@escaping((Model) -> Void)) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            guard let item:Model = self?.board as? Model else { return }
            board(item)
        }
    }
    
    func saveLocal<Model>(session: Model) where Model:SessionProtocol, Model:Encodable {
        self.onSaveSession?()
    }
    
    func saveLocal<Model>(board:Model) where Model:BoardProtocol, Model:Encodable {
        self.onSaveBoard?()
    }
}
