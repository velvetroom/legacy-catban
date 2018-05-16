import UIKit

class DragColumn:DragObjectProtocol, DragParentProtocol {
    var position:DragPositionProtocol
    var nextColumn:DragColumn?
    var childItem:DragItemProtocol?
    let paddingVertical:CGFloat
    let paddingHorizontal:CGFloat
    
    init() {
        self.position = DragPositionStatic()
        self.paddingVertical = ViewConstants.ColumnTitle.height
        self.paddingHorizontal = ViewConstants.Column.paddingHorizontal
    }
    
    func add(item:DragItemProtocol) {
        if let parent:DragParentProtocol = self.parentFor(item:item) {
            parent.replaceChild(item:item)
        } else {
            self.replaceChild(item:item)
        }
    }
    
    private func parentFor(item:DragItemProtocol) -> DragParentProtocol? {
        var child:DragItemProtocol? = self.childItem
        while let current:DragItemProtocol = child {
            if current.minY > item.midY {
                return current.parent
            }
            if let parent:DragParentProtocol = current as? DragParentProtocol {
                child = parent.childItem
            }
        }
        return nil
    }
}
