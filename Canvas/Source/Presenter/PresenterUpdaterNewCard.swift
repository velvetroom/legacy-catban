import Foundation

class PresenterUpdaterNewCard:PresenterUpdaterBoardItemProtocol {
    weak var viewBoard:ViewBoard!
    weak var column:MapColumn!
    var viewModel:ViewModelBoardItemProtocol!
    let viewItem:ViewBoardItem
    let mapItem:MapItemProtocol
    
    required init() {
        self.viewItem = ViewNewCard()
        self.mapItem = MapNewCard()
        self.mapItem.view = self.viewItem
        self.viewItem.mapItem = self.mapItem
    }
    
    func configureContent() { }
}
