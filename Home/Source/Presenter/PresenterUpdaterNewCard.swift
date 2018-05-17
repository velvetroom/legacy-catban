import Foundation

class PresenterUpdaterNewCard:PresenterUpdaterBoardItemProtocol {
    var viewBoard:ViewBoard!
    var viewModel:ViewModelBoardItemProtocol!
    var column:MapColumn!
    let viewItem:ViewBoardItem
    let dragItem:MapItemProtocol
    
    required init() {
        self.viewItem = ViewNewCard()
        self.dragItem = MapNewCard()
        self.dragItem.view = self.viewItem
    }
    
    func configureContent() { }
}
