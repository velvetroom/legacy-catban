import Foundation
@testable import catban

class MockProjectProtocol:ProjectProtocol {
    var onMoveCard:((IndexPath, IndexPath) -> Void)?
    var columns:[ProjectColumn]
    var name:String
    
    init() {
        self.columns = []
        self.name = String()
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveCard?(origin, destination)
    }
}
