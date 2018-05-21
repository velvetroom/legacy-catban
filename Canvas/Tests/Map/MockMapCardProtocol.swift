import UIKit
@testable import Canvas

class MockMapCardProtocol:MapCardProtocol {
    var parent:MapParentProtocol!
    var childItem:MapItemProtocol?
    var identifier:String
    var view:ViewNode!
    var minY:CGFloat
    var maxY:CGFloat
    var minX:CGFloat
    var maxX:CGFloat
    
    init() {
        self.identifier = String()
        self.minY = 0
        self.maxY = 0
        self.minX = 0
        self.maxX = 0
    }
}
