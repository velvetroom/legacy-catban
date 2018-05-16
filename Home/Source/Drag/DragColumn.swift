import UIKit

class DragColumn:DragParentProtocol {
    weak var view:ViewColumn!
    var nextColumn:DragColumn?
    var childItem:DragItemProtocol?
    
    var minX:CGFloat {
        get {
            return self.view.layoutLeft.constant
        }
    }
    
    var maxX:CGFloat {
        get {
            return self.view.layoutLeft.constant + ViewConstants.Column.width
        }
    }
}
