import UIKit

class DragCard:DragItemProtocol, DragParentProtocol {
    weak var parent:DragParentProtocol!
    weak var view:ViewBoardItem!
    var childItem:DragItemProtocol?
}
