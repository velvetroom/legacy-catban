import Foundation

protocol LoadProtocol {
    var dispatchQueue:DispatchQueue { get set }
    
    func loadBoard(completion:@escaping((Board) -> Void))
}
