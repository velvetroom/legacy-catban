import Foundation

extension MapParentProtocol {
    func replaceChild(item:MapItemProtocol) {
        if let parent:MapParentProtocol = item as? MapParentProtocol {
            parent.childItem = self.childItem
            self.childItem?.parent = parent
        }
        self.assignChild(item:item)
    }
    
    func detachChild() {
        if let parent:MapParentProtocol = self.childItem as? MapParentProtocol {
            self.rearrangeChildsFrom(parent:parent)
        } else {
            self.clearChild()
        }
    }
    
    func updateChildPosition() {
        self.childItem?.minY = self.maxY + Constants.Board.verticalSpacing
        self.childItem?.minX = self.minX
    }
    
    private func assignChild(item:MapItemProtocol) {
        item.parent = self
        self.childItem = item
        self.updateChildPosition()
    }
    
    private func clearChild() {
        self.childItem?.parent = nil
        self.childItem = nil
    }
    
    private func rearrangeChildsFrom(parent:MapParentProtocol) {
        if let childItem:MapItemProtocol = parent.childItem {
            parent.childItem = nil
            self.assignChild(item:childItem)
        } else {
            self.clearChild()
        }
    }
}
