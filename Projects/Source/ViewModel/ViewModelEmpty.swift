import UIKit

struct ViewModelEmpty:ViewModelProtocol {
    let listHidden:Bool
    let selectorHidden:Bool
    let emptyHidden:Bool
    let toolbarHidden:Bool
    
    init() {
        self.listHidden = true
        self.selectorHidden = true
        self.emptyHidden = false
        self.toolbarHidden = true
    }
}
