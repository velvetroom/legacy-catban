import UIKit
import Board

class StateSelecting:StateProtocol {
    weak var project:ProjectProtocol!
    var index:Int
    
    init() {
        self.index = 0
    }
    
    func selectCurrentOn(view: ViewList) {
        view.selectItem(at:IndexPath(item:self.index, section:0), animated:true,
                        scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
}
