import Foundation

class MapCard:MapItemProtocol, MapParentProtocol {
    weak var view:ViewNode!
    weak var parent:MapParentProtocol!
    var childItem:MapItemProtocol?
}
