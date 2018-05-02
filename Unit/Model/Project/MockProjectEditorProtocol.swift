import Foundation
@testable import catban

class MockProjectEditorProtocol:ProjectEditorProtocol {
    var onMoveCardFromOrigin:((IndexPath, IndexPath) -> Void)?
    var project:ProjectProtocol
    
    init() {
        self.project = Project()
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveCardFromOrigin?(origin, destination)
    }
}
