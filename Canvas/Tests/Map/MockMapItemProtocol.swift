import UIKit
@testable import Canvas

class MockMapItemProtocol:MapItemProtocol {
    var parent:MapParentProtocol!
    var view:ViewItem!
    var minX:CGFloat
    var minY:CGFloat
    var maxX:CGFloat
    var maxY:CGFloat
    
    init() {
        self.minX = 0
        self.minY = 0
        self.maxX = 0
        self.maxY = 0
    }
}
