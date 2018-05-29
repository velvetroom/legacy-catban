import UIKit

struct ViewModelEmpty:ViewModelProtocol {
    let listHidden:Bool
    let emptyHidden:Bool
    let menuEnabled:Bool
    let menuAlpha:CGFloat
    
    init() {
        self.listHidden = true
        self.emptyHidden = false
        self.menuEnabled = false
        self.menuAlpha = ViewConstants.Menu.alphaOff
    }
}