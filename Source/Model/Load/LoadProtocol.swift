import Foundation

protocol LoadProtocol {
    var repository:RepositoryProtocol { get set }
    var dispatchQueue:DispatchQueue { get set }
    
    func loadBoard(completion:@escaping((BoardProtocol) -> Void))
}
