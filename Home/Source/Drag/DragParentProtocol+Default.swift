import UIKit

extension DragParentProtocol {
    func replaceChild(item:DragItemProtocol) {
        if let parent:DragParentProtocol = item as? DragParentProtocol {
            parent.childItem = self.childItem
            self.childItem?.parent = parent
        }
        self.childItem = item
        self.updateChildPosition()
        item.parent = self
    }
    
    func updateChildPosition() {
        self.childItem?.minY = self.maxY + ViewConstants.Board.verticalSpacing
        self.childItem?.minX = self.minX
    }
}
