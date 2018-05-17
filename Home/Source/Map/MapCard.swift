import Foundation

class MapCard:MapItemProtocol, MapParentProtocol {
    weak var view:ViewBoardElement!
    weak var parent:MapParentProtocol!
    var childItem:MapItemProtocol?
}
