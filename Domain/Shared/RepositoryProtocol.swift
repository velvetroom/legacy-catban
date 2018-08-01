import Foundation

public protocol RepositoryProtocol {
    func loadLocal<Model:Decodable>(session:@escaping((Model) -> Void), error:@escaping((Error) -> Void))
    func loadLocal<Model:Decodable>(identifier:String, board:@escaping((Model) -> Void))
    func saveLocal<Model>(session:Model) where Model:Encodable, Model:SessionProtocol
    func saveLocal<Model>(board:Model) where Model:Encodable, Model:BoardProtocol
    
    init()
}
