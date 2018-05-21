import UIKit
import Board
@testable import Canvas

class MockMapColumnProtocol:MapColumnProtocol {
    var onAddItem:(() -> Void)?
    var onOrderItem:(() -> Void)?
    var height:CGFloat
    var childItem:MapItemProtocol?
    var view:ViewNode!
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
    
    func order(item:MapItemProtocol) {
        self.onOrderItem?()
    }
}
