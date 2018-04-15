import Foundation

protocol LoadProtocol {
    func loadBoard(completion:@escaping((Board) -> Void))
}
