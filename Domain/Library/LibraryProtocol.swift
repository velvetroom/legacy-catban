import Foundation

public protocol LibraryProtocol:AnyObject {
    var session:SessionProtocol { get }
    var boards:[BoardProtocol] { get }
    
    func loadSession(completion:@escaping(() -> Void))
    func loadBoards(completion:@escaping(() -> Void), error:@escaping((Error) -> Void))
}
