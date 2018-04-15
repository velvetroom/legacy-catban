import Foundation

protocol RepositoryProtocol {
    var local:RepositoryLocalProtocol { get set }
    
    func loadBoardFromLocal() throws -> BoardProtocol
}
