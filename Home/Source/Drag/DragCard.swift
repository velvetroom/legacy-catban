import UIKit

class DragCard:DragItemProtocol, DragParentProtocol {
    weak var parent:DragParentProtocol!
    var position:DragPositionProtocol
    var childItem:DragItemProtocol?
    
    init() {
        self.position = DragPositionStatic()
    }
    
    func becomeInteractive() {
        self.change(position:DragPositionInteractive())
    }
    
    func becomeStatic() {
        self.change(position:DragPositionStatic())
    }
    
    private func change(position:DragPositionProtocol) {
        position.view = self.view
        self.position = position
    }
}
