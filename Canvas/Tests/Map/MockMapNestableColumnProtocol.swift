import UIKit
import Board
@testable import Canvas

class MockMapNestableColumnProtocol:MapNestableColumnProtocol {
    var onAddItem:(() -> Void)?
    var onOrderItem:(() -> Void)?
    var height:CGFloat
    var childItem:MapItemProtocol?
    var view:ViewItem!
    var maxX:CGFloat
    var order:OrderColumn
    var identifier:String
    
    init() {
        self.height = 0
        self.maxX = 0
        self.order = OrderColumn()
        self.identifier = String()
    }
    
    func add(item:MapItemProtocol) {
        self.onAddItem?()
    }
    
    func arrange(item:MapItemProtocol) {
        self.onOrderItem?()
    }
}
