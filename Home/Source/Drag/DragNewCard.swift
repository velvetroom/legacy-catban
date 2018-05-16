import UIKit

class DragNewCard:DragItemProtocol {
    weak var parent:DragParentProtocol!
    var position:DragPositionProtocol
    
    init() {
        self.position = DragPositionStatic()
    }
}
