import UIKit

struct ViewModelList:ViewModelProtocol {
    var items:[ViewModelListItem]
    let selectorHidden:Bool
    let listHidden:Bool
    let emptyHidden:Bool
    let toolbarHidden:Bool
    
    init() {
        self.items = []
        self.selectorHidden = false
        self.listHidden = false
        self.emptyHidden = true
        self.toolbarHidden = false
    }
}
