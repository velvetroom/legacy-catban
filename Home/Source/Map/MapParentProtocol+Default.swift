import UIKit

extension MapParentProtocol {
    func replaceChild(item:MapItemProtocol) {
        if let parent:MapParentProtocol = item as? MapParentProtocol {
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
