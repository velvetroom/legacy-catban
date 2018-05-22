import UIKit

class MapColumn:MapColumnProtocol {
    weak var view:ViewItem!
    var childItem:MapItemProtocol?
    var identifier:String
    
    init() {
        self.identifier = String()
    }
    
    var height:CGFloat {
        get {
            var bottom:CGFloat = Constants.ColumnTitle.height
            if let lastItem:MapItemProtocol = self.lastItem {
                bottom = lastItem.maxY
            }
            return bottom + Constants.Column.paddingBottom
        }
    }
    
    func arrange(item:MapItemProtocol) {
        let parent:MapParentProtocol = self.parentFor(item:item)
        parent.replaceChild(item:item)
    }
    
    func add(item:MapItemProtocol) {
        self.lastParent.replaceChild(item:item)
    }
}
