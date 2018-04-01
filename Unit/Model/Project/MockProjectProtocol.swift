import Foundation
@testable import catban

class MockProjectProtocol:ProjectProtocol {
    var onMoveCard:((IndexPath, IndexPath) -> Void)?
    var onIndexForRightCard:(() -> Void)?
    var indexForRight:IndexPath
    var columns:[ProjectColumn]
    var name:String
    
    init() {
        self.columns = []
        self.name = String()
        self.indexForRight = IndexPath(item:0, section:0)
    }
    
    func moveCardFrom(origin:IndexPath, to destination:IndexPath) {
        self.onMoveCard?(origin, destination)
    }
    
    func indexOnRightForCardAt(index:IndexPath) -> IndexPath {
        self.onIndexForRightCard?()
        return self.indexForRight
    }
}
