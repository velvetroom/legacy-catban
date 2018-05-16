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
        self.updateSize()
    }
    
    func addToLast(item:DragItemProtocol) {
        self.lastParent.replaceChild(item:item)
        self.updateSize()
    }
    
    private var lastParent:DragParentProtocol {
        get {
            if let lastItem:DragParentProtocol = self.lastItem as? DragParentProtocol {
                return lastItem
            }
            return self
        }
    }
    
    private var lastItem:DragItemProtocol? {
        get {
            var childItem:DragItemProtocol? = self.childItem
            while let parentItem:DragParentProtocol = childItem as? DragParentProtocol {
                if let nextItem:DragItemProtocol = parentItem.childItem {
                    childItem = nextItem
                } else {
                    break
                }
            }
            return childItem
        }
    }
    
    private var contentBottom:CGFloat {
        get {
            var bottom:CGFloat = ViewConstants.ColumnTitle.height
            if let lastItem:DragItemProtocol = self.lastItem {
                bottom = lastItem.maxY
            }
            return bottom
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
    
    private func updateSize() {
        self.view.layoutHeight.constant = self.contentBottom + ViewConstants.Column.paddingBottom
    }
}
