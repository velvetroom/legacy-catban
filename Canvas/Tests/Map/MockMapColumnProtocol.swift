import UIKit
import Board
@testable import Canvas

class MockMapColumnProtocol:MapColumnProtocol {
    var height:CGFloat
    var maxX:CGFloat
    var view:ViewItem!
    
    init() {
        self.height = 0
        self.maxX = 0
    }
}
