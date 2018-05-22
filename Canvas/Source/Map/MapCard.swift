import Foundation

class MapCard:MapCardProtocol {
    weak var view:ViewItem!
    weak var parent:MapParentProtocol!
    var childItem:MapItemProtocol?
    var identifier:String
    
    init() {
        self.identifier = String()
    }
}
