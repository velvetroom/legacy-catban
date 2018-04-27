import Foundation

protocol BoardRepositoryProtocol {
    var repository:RepositoryProtocol { get set }
    var dispatchQueue:DispatchQueue { get set }
    
    func save(board:BoardProtocol)
}
