import Foundation
import Shared

struct ViewModelList:ViewModelPropertyProtocol {
    weak var observer:ViewModelObserverProtocol?
    var items:[ViewModelListItem]
    
    init() {
        self.items = []
    }
}
