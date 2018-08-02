import Foundation
@testable import Domain

class MockLocalRepositoryProtocol:CacheServiceProtocol {
    var error:Error?
    var onSaveSession:(() -> Void)?
    var onSaveBoard:(() -> Void)?
    var onCreateRemote:(() -> Void)?
    var session:Configuration.Session
    var board:Configuration.Board
    
    required init() {
        self.session = Configuration.Session()
        self.board = Configuration.Board()
    }
    
    func load<Model>(session:@escaping((Model) -> Void),
                          error:@escaping((Error) -> Void)) where Model:Decodable, Model:SessionProtocol {
        if let throwingError:Error = self.error {
            error(throwingError)
        } else {
            session(self.session as! Model)
        }
    }
    
    func load<Model>(identifier:String,
                          board:@escaping((Model) -> Void)) where Model:Decodable, Model:BoardProtocol {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            guard let item:Model = self?.board as? Model else { return }
            board(item)
        }
    }
    
    func save<Model>(session:Model) where Model:SessionProtocol, Model:Encodable {
        self.onSaveSession?()
    }
    
    func save<Model>(identifier:String, board:Model) where Model:Encodable, Model:BoardProtocol {
        self.onSaveBoard?()
    }
    
    func loadRemote<Model>(identifier:String,
                           board:@escaping((Model) -> Void)) where Model:Decodable, Model:BoardProtocol {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            guard let item:Model = self?.board as? Model else { return }
            board(item)
        }
    }
    
    func createRemote<Model>(board:Model,
                             completion:@escaping((String) -> Void)) where Model:BoardProtocol, Model:Encodable {
        self.onCreateRemote?()
        completion(String())
    }
}
