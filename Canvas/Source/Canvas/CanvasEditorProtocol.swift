import Foundation

protocol CanvasEditorProtocol:class {
    func editCardWith(identifier:String)
    func editColumnWith(identifier:String)
    func createNewCard()
    func createNewColumn()
}
