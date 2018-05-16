import Foundation

class PresenterUpdaterNewCard:PresenterUpdaterBoardItemProtocol {
    var viewBoard:ViewBoard!
    var viewModel:ViewModelBoardItemProtocol!
    var column:DragColumn!
    let viewItem:ViewBoardItem
    let dragItem:DragItemProtocol
    
    required init() {
        self.viewItem = ViewNewCard()
        self.dragItem = DragNewCard()
        self.dragItem.view = self.viewItem
    }
    
    func configureContent() { }
}
