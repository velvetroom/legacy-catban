import UIKit
import Board

class StateSelecting:StateProtocol {
    weak var project:ProjectProtocol!
    var index:Int
    
    init() {
        self.index = 0
    }
    
    func selectCurrentOn(view: ViewList) {
        
    }
}
