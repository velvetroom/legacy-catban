import Foundation
import Domain
import CodableHero
import Firebase

class Repository:RepositoryProtocol {
    private let codableHero:CodableHero
    
    required init() {
        self.codableHero = Factory.makeCodableHero()
    }
    
    func load<Model:Decodable>(session:@escaping((Model) -> Void), error:@escaping((Error) -> Void)) {
        self.codableHero.load(path:Constants.sessionPath, completion:session, error:error)
    }
    
    func load<Model:Decodable>(identifier:String, board:@escaping((Model) -> Void), error:@escaping((Error) -> Void)) {
        Firestore.firestore().document(identifier).getDocument { [weak self] (snap:DocumentSnapshot?, fail:Error?) in
            if let fail:Error = fail {
                error(fail)
            } else if let json:[String:Any] = snap?.data() {
                self?.loaded(json:json, completion:board, error:error)
            } else {
                error(RepositoryError.boardNotFound)
            }
        }
    }
    
    func save<Model:Encodable>(session:Model) {
        self.codableHero.save(model:session, path:Constants.sessionPath, completion:nil, error:nil)
    }
    
    private func loaded<Model:Decodable>(json:[String:Any], completion:@escaping((Model) -> Void),
                                         error:@escaping((Error) -> Void)) {
        do {
            let data:Data = try JSONSerialization.data(withJSONObject:json, options:JSONSerialization.WritingOptions())
            let model:Model = try JSONDecoder().decode(Model.self, from:data)
            completion(model)
        } catch let throwingError {
            error(throwingError)
        }
    }
}

private struct Constants {
    static let sessionPath:String = "Session.catban"
}
