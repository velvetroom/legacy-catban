import Foundation

class PresenterNewCard:PresenterItemProtocol {
    weak var viewBoard:ViewContainer!
    weak var column:MapColumn!
    var viewModel:ViewModelProtocol!
    let viewItem:ViewItem
    let mapItem:MapItemProtocol
    
    required init() {
        self.viewItem = ViewNewCard()
        self.mapItem = MapNewCard()
        self.mapItem.view = self.viewItem
        self.viewItem.mapItem = self.mapItem
    }
    
    func configureContent() { }
}
