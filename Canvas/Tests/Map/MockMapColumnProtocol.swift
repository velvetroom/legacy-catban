import UIKit
@testable import Canvas

class MockMapColumnProtocol:MapColumnProtocol {
    var view:ViewItem!
    var height:CGFloat
    
    init() {
        self.height = 0
    }
}
