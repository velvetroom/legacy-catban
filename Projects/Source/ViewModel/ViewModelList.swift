import UIKit

struct ViewModelList:ViewModelProtocol {
    var items:[ViewModelListItem]
    let listHidden:Bool
    let emptyHidden:Bool
    let menuEnabled:Bool
    let menuAlpha:CGFloat
    
    init() {
        self.items = []
        self.listHidden = false
        self.emptyHidden = true
        self.menuEnabled = true
        self.menuAlpha = ViewConstants.Menu.alphaOn
    }
}
