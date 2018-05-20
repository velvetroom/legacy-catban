import Foundation
@testable import Canvas

class MockDragStateChangerProtocol:DragStateChangerProtocol {
    var onChange:(() -> Void)?
    
    func change(stateType:DragStateProtocol.Type) {
        self.onChange?()
    }
}
