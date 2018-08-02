import Foundation

public protocol RepositoryProtocol {
    func loadLocal<Model>(session:@escaping((Model) -> Void),
                          error:@escaping((Error) -> Void)) where Model:Decodable, Model:SessionProtocol
    func loadLocal<Model>(identifier:String,
                          board:@escaping((Model) -> Void)) where Model:Decodable, Model:BoardProtocol
    func saveLocal<Model>(session:Model) where Model:Encodable, Model:SessionProtocol
    func saveLocal<Model>(identifier:String, board:Model) where Model:Encodable, Model:BoardProtocol
    func createRemote<Model>(board:Model,
                             completion:@escaping((String) -> Void)) where Model:Encodable, Model:BoardProtocol
    
    init()
}
