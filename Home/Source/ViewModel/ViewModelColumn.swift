import UIKit

struct ViewModelColumn {
    var name:String
    var items:[ViewModelBoardItemProtocol]
    
    init() {
        self.name = String()
        self.items = []
    }
}
