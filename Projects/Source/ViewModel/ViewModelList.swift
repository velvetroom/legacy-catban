import UIKit

struct ViewModelList:ViewModelProtocol {
    var items:[ViewModelListItem]
    let selectorHidden:Bool
    let listHidden:Bool
    let emptyHidden:Bool
    let menuEnabled:Bool
    let menuAlpha:CGFloat
    
    init() {
        self.items = []
        self.selectorHidden = false
        self.listHidden = false
        self.emptyHidden = true
        self.menuEnabled = true
        self.menuAlpha = ViewConstants.Menu.alphaOn
    }
}
