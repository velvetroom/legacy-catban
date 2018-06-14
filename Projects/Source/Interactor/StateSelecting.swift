import Foundation

class StateSelecting:StateProtocol {
    var selected:IndexPath
    var index:Int {
        didSet {
            self.selected = IndexPath(item:self.index, section:0)
        }
    }
    
    init() {
        self.index = 0
        self.selected = IndexPath(item:0, section:0)
    }
}
