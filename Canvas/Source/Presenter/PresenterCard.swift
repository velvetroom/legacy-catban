import Foundation

class PresenterCard:PresenterItemProtocol {
    weak var viewBoard:ViewBoard!
    weak var column:MapColumn!
    var viewModel:ViewModelProtocol!
    let viewItem:ViewBoardItem
    let mapItem:MapItemProtocol
    
    required init() {
        self.viewItem = ViewCard()
        self.mapItem = MapCard()
        self.mapItem.view = self.viewItem
        self.viewItem.mapItem = self.mapItem
    }
    
    func configureContent() {
        let viewItem:ViewCard = self.viewItem as! ViewCard
        let viewModel:ViewModelCard = self.viewModel as! ViewModelCard
        viewItem.identifier = viewModel.identifier
        viewItem.labelContent.text = viewModel.content
    }
}
