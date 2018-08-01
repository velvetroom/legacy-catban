import Foundation

public protocol LibraryProtocol:AnyObject {
    var delegate:LibraryDelegate? { get set }
    var session:SessionProtocol { get }
    var boards:[BoardProtocol] { get }
    
    func loadSession()
    func loadBoards()
}
