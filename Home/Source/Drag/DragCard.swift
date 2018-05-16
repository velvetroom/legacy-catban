import UIKit

class DragCard:DragItemProtocol, DragParentProtocol {
    weak var parent:DragParentProtocol!
    var position:DragPositionProtocol
    var childItem:DragItemProtocol?
    let paddingVertical:CGFloat
    let paddingHorizontal:CGFloat
    
    init() {
        self.position = DragPositionStatic()
        self.paddingVertical = ViewConstants.Board.verticalSpacing
        self.paddingHorizontal = 0
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
