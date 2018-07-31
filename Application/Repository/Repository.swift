import Foundation
import Domain
import CodableHero

class Repository:RepositoryProtocol {
    private let codableHero:CodableHero
    
    required init() {
        self.codableHero = Factory.makeCodableHero()
    }
    
    func load<Model:Decodable>(session:@escaping((Model) -> Void), error:@escaping((Error) -> Void)) {
        self.codableHero.load(path:Constants.sessionPath, completion:session, error:error)
    }
    
    func loadBoards(identifiers:[String]) throws -> [Data] {
        throw RepositoryError.sessionNotFound
    }
    
    func save<Model:Encodable>(session:Model) {
        self.codableHero.save(model:session, path:Constants.sessionPath, completion:nil, error:nil)
    }
}

private struct Constants {
    static let sessionPath:String = "Session.catban"
}
