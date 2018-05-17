import UIKit

class MapNewCard:MapItemProtocol {
    weak var parent:MapParentProtocol!
    var position:MapPositionProtocol
    
    init() {
        self.position = MapPositionStatic()
    }
}
