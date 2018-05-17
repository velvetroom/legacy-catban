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
        guard
            let parent:MapParentProtocol = self.childItem as? MapParentProtocol,
            let childItem:MapItemProtocol = parent.childItem
        else { return }
        parent.childItem = nil
        self.assignChild(item:childItem)
    }
    
    func updateChildPosition() {
        self.childItem?.minY = self.maxY + ViewConstants.Board.verticalSpacing
        self.childItem?.minX = self.minX
    }
    
    private func assignChild(item:MapItemProtocol) {
        item.parent = self
        self.childItem = item
        self.updateChildPosition()
    }
}
