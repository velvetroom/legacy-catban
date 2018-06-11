import UIKit

struct ViewModelEdit:ViewModelProtocol {
    var item:ViewModelListItem!
    let listHidden:Bool
    let emptyHidden:Bool
    let toolbarHidden:Bool
    
    init() {
        self.listHidden = false
        self.emptyHidden = true
        self.toolbarHidden = false
    }
}
