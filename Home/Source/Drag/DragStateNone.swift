import Foundation

class DragStateNone:DragStateProtocol {
    weak var drag:DragProtocol!
    weak var state:DragStateChangerProtocol!
    
    required init() { }
}
