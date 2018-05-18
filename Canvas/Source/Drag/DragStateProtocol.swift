import Foundation

protocol DragStateProtocol {
    var drag:DragProtocol! { get set }
    var state:DragStateChangerProtocol! { get set }
    
    init()
    func update()
    func end()
}
