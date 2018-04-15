import Foundation

protocol RepositoryProtocol {
    var local:LocalProtocol { get set }
    
    func loadBoardFromLocal() throws -> BoardProtocol
}
