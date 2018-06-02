import Foundation

extension MapColumn {
    var children:[MapItemProtocol] {
        get {
            var items:[MapItemProtocol] = []
            var childItem:MapItemProtocol? = self.childItem
            while let item:MapItemProtocol = childItem {
                items.append(item)
                guard
                    let parentItem:MapParentProtocol = item as? MapParentProtocol
                else { break }
                childItem = parentItem.childItem
            }
            return items
        }
    }
    
    var lastParent:MapParentProtocol {
        get {
            var children:[MapItemProtocol] = self.children
            while children.isEmpty == false {
                let lastChild:MapItemProtocol = children.removeLast()
                if let parent:MapParentProtocol = lastChild as? MapParentProtocol {
                    return parent
                }
            }
            return self
        }
    }
    
    var lastItem:MapItemProtocol? {
        get {
            return self.children.last
        }
    }
    
    func parentFor(item:MapItemProtocol) -> MapParentProtocol {
        var parent:MapParentProtocol = self.lastParent
        while parent.minY > item.minY {
            guard
                let item:MapItemProtocol = parent as? MapItemProtocol
            else { break }
            parent = item.parent
        }
        return parent
    }
}
