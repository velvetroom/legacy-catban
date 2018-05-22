import Foundation

public protocol CanvasDelegateProtocol:class {
    func editCardWith(identifier:String)
    func createNewCard()
    func createNewColumn()
}
