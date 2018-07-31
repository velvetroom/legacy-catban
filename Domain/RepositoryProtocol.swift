import Foundation

public protocol RepositoryProtocol {
    func load<Model:Decodable>(session:@escaping((Model) -> Void), error:@escaping((Error) -> Void))
    func load<Model:Decodable>(identifier:String, board:@escaping((Model) -> Void), error:@escaping((Error) -> Void))
    func save<Model:Encodable>(session:Model)
    
    init()
}
