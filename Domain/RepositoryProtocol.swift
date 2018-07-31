import Foundation

public protocol RepositoryProtocol {
    func load<Model:Decodable>(session:@escaping((Model) -> Void), error:@escaping((Error) -> Void))
    func loadBoards(identifiers:[String]) throws -> [Data]
    func save<Model:Encodable>(session:Model)
    
    init()
}
