import Foundation
import Shared

struct ViewModelList:ViewModelPropertyProtocol {
    var observing:((ViewModelList) -> Void)?
    var items:[ViewModelListItem]
    
    init() {
        self.items = []
    }
}
