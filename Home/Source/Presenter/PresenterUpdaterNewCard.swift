import Foundation

class PresenterUpdaterNewCard:PresenterUpdaterBoardItemProtocol {
    var viewBoard:ViewBoard!
    var viewModel:ViewModelBoardItemProtocol!
    var column:MapColumn!
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
