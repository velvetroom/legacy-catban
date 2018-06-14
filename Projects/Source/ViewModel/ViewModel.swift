import Foundation
import Shared

public struct ViewModel:ViewModelProtocol {
    public var toolbarHidden:Bool
    var items:[ViewModelItem]
    var listHidden:Bool
    var emptyHidden:Bool
    
    public init() {
        self.toolbarHidden = true
        self.items = []
        self.listHidden = true
        self.emptyHidden = false
    }
}
