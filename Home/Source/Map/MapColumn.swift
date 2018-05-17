import UIKit

class MapColumn:MapNodeProtocol, MapParentProtocol {
    var position:MapPositionProtocol
    var nextColumn:MapColumn?
    var childItem:MapItemProtocol?
    
    init() {
        self.position = MapPositionStatic()
    }
    
    func add(item:MapItemProtocol) {
        if let parent:MapParentProtocol = self.parentFor(item:item) {
            parent.replaceChild(item:item)
        } else {
            self.replaceChild(item:item)
        }
        self.updateSize()
    }
    
    func append(item:MapItemProtocol) {
        self.lastParent.replaceChild(item:item)
        self.updateSize()
    }
    
    private var lastParent:MapParentProtocol {
        get {
            if let lastItem:MapParentProtocol = self.lastItem as? MapParentProtocol {
                return lastItem
            }
            return self
        }
    }
    
    private var lastItem:MapItemProtocol? {
        get {
            var childItem:MapItemProtocol? = self.childItem
            while let parentItem:MapParentProtocol = childItem as? MapParentProtocol {
                if let nextItem:MapItemProtocol = parentItem.childItem {
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
            if let lastItem:MapItemProtocol = self.lastItem {
                bottom = lastItem.maxY
            }
            return bottom
        }
    }
    
    private func parentFor(item:MapItemProtocol) -> MapParentProtocol? {
        var child:MapItemProtocol? = self.childItem
        while let current:MapItemProtocol = child {
            if current.minY > item.midY {
                return current.parent
            }
            if let parent:MapParentProtocol = current as? MapParentProtocol {
                child = parent.childItem
            }
        }
        return nil
    }
    
    private func updateSize() {
        self.view.layoutHeight.constant = self.contentBottom + ViewConstants.Column.paddingBottom
    }
}
