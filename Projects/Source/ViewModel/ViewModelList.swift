import UIKit

struct ViewModelList:ViewModelProtocol {
    var items:[ViewModelListItem]
    let listHidden:Bool
    let emptyHidden:Bool
    let toolbarHidden:Bool
    
    init() {
        self.items = []
        self.listHidden = false
        self.emptyHidden = true
        self.toolbarHidden = false
    }
}
