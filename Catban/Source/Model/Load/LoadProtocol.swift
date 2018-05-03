import Foundation

protocol LoadProtocol:ModelProtocol {
    func loadBoard(completion:@escaping((BoardProtocol) -> Void))
}
