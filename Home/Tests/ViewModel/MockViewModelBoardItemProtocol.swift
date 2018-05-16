import UIKit
@testable import Home

class MockViewModelBoardItemProtocol:ViewModelBoardItemProtocol {
    var top:CGFloat
    var left:CGFloat
    var height:CGFloat
    var width:CGFloat
    
    init() {
        self.top = 0
        self.left = 0
        self.height = 0
        self.width = 0
    }
}
