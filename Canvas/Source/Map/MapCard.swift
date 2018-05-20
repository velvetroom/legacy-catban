import Foundation

class MapCard:MapCardProtocol {
    weak var view:ViewNode!
    weak var parent:MapParentProtocol!
    var childItem:MapItemProtocol?
}
