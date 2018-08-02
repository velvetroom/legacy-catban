import Foundation
import Domain
import CodableHero
import Firebase

class RepositoryService:RepositoryProtocol {
    private let codableHero:CodableHero
    
    required init() {
        self.codableHero = Factory.makeCodableHero()
    }
    
    func loadLocal<Model>(session:@escaping((Model) -> Void),
                          error:@escaping((Error) -> Void)) where Model:Decodable, Model:SessionProtocol {
        self.codableHero.load(path:Constants.session + Constants.file, completion:session, error:error)
    }
    
    func loadLocal<Model>(identifier:String,
                          board:@escaping((Model) -> Void)) where Model:Decodable, Model:BoardProtocol {
        self.codableHero.load(path:identifier + Constants.file, completion:board, error:nil)
    }
    
    func loadRemote() {
//        Firestore.firestore().document(identifier).getDocument { [weak self] (snap:DocumentSnapshot?, fail:Error?) in
//            if let fail:Error = fail {
//                error(fail)
//            } else if let json:[String:Any] = snap?.data() {
//                self?.loaded(json:json, completion:board, error:error)
//            } else {
//                error(RepositoryError.boardNotFound)
//            }
//        }
    }
    
    func saveLocal<Model>(session:Model) where Model:Encodable, Model:SessionProtocol {
        self.codableHero.save(model:session, path:Constants.session + Constants.file, completion:nil, error:nil)
    }
    
    func saveLocal<Model>(identifier:String, board:Model) where Model:Encodable, Model:BoardProtocol {
        self.codableHero.save(model:board, path:identifier + Constants.file, completion:nil, error:nil)
    }
    
    func createRemote<Model>(board:Model, completion:@escaping((String) -> Void)) where Model:BoardProtocol, Model:Encodable {
        let document:DocumentReference = Firestore.firestore().collection(Constants.boards).document()
        document.setData(self.json(model:board)) { (error:Error?) in
            if let error:Error = error {
                assertionFailure(error.localizedDescription)
            } else {
                completion(document.documentID)
            }
        }
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
    
    private func json<Model:Encodable>(model:Model) -> [String:Any] {
        do {
            let data:Data = try JSONEncoder().encode(model)
            let json:Any = try JSONSerialization.jsonObject(with:data, options:JSONSerialization.ReadingOptions())
            return json as! [String:Any]
        } catch {
            return [:]
        }
    }
}

private struct Constants {
    static let session:String = "Session"
    static let file:String = ".catban"
    static let boards:String = "Boards"
}
