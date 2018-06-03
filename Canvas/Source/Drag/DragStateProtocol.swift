import Foundation

protocol DragStateProtocol {
    var event:DragEventProtocol! { get set }
    var changer:DragStateChangerProtocol! { get set }
    var mapEditor:MapEditorProtocol! { get set }
    
    init()
    func update()
    func end()
}
