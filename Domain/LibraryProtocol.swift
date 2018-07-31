import Foundation

public protocol LibraryProtocol:AnyObject {
    var boards:[BoardProtocol] { get }
    func loadBoards(completion:@escaping(() -> Void), error:@escaping((Error) -> Void))
}
