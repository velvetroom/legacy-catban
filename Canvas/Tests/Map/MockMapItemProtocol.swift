import UIKit
@testable import Canvas

class MockMapItemProtocol:MapItemProtocol {
    var parent:MapParentProtocol!
    var view:ViewNode!
    var minX:CGFloat
    var minY:CGFloat
    
    init() {
        self.minX = 0
        self.minY = 0
    }
}
