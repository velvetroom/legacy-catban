import Foundation
@testable import Canvas

class MockDragStateChangerProtocol:DragStateChangerProtocol {
    var onChange:((DragStateProtocol.Type) -> Void)?
    
    func change(stateType:DragStateProtocol.Type) {
        self.onChange?(stateType)
    }
}
