import Foundation

protocol RepositoryLocalProtocol {
    var file:FileProtocol { get set }
    var deserialiser:DeserialiserProtocol { get set }
    var serialiser:SerialiserProtocol { get set }
    
    func loadBoard() throws -> BoardProtocol
    func save(board:BoardProtocol) throws
}
