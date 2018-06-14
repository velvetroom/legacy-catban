import Foundation
import Shared

public struct ViewModel:ViewModelProtocol {
    var items:[ViewModelItem]
    var listHidden:Bool
    var emptyHidden:Bool
    
    public init() {
        self.items = []
        self.listHidden = true
        self.emptyHidden = false
    }
}
