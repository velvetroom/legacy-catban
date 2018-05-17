import UIKit

class MapColumn:MapNodeProtocol, MapParentProtocol {
    var position:MapPositionProtocol
    var childItem:MapItemProtocol?
    
    var lastParent:MapParentProtocol {
        get {
            if let lastItem:MapItemProtocol = self.lastItem {
                if let parent:MapParentProtocol = lastItem as? MapParentProtocol {
                    return parent
                }
                return lastItem.parent
            }
            return self
        }
    }
    
    var lastItem:MapItemProtocol? {
        get {
            var childItem:MapItemProtocol? = self.childItem
            while let parentItem:MapParentProtocol = childItem as? MapParentProtocol {
                guard
                    let nextItem:MapItemProtocol = parentItem.childItem
                else { break }
                childItem = nextItem
            }
            return childItem
        }
    }
    
    init() {
        self.position = MapPositionStatic()
    }
    
    func add(item:MapItemProtocol) {
        if let parent:MapParentProtocol = self.parentFor(item:item) {
            parent.replaceChild(item:item)
        } else {
            self.replaceChild(item:item)
        }
    }
    
    func append(item:MapItemProtocol) {
        self.lastParent.replaceChild(item:item)
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
}
