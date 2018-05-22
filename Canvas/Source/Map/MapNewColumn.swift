import UIKit

class MapNewColumn:MapColumnProtocol {
    weak var view:ViewItem!
    let height:CGFloat
    
    init() {
        self.height = Constants.ColumnTitle.height
    }
}
