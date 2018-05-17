import Foundation

protocol DragStateProtocol {
    var drag:Drag! { get set }
    
    init()
    func update()
    func end()
}
