import Foundation

protocol RepositoryLocalProtocol {
    var file:FileProtocol { get set }
    
    func loadBoard() throws -> BoardProtocol
}
