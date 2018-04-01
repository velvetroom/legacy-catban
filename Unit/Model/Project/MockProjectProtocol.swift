import Foundation
@testable import catban

class MockProjectProtocol:ProjectProtocol {
    var onMove:((Int, Int, Int) -> Void)?
    var columns:[ProjectColumn]
    var name:String
    
    init() {
        self.columns = []
        self.name = String()
    }
    
    func move(cardIndex:Int, to destination:Int, in columnIndex:Int) {
        self.onMove?(cardIndex, destination, columnIndex)
    }
}
