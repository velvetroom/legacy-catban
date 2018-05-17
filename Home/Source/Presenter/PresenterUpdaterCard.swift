import Foundation

class PresenterUpdaterCard:PresenterUpdaterBoardItemProtocol {
    var viewBoard:ViewBoard!
    var viewModel:ViewModelBoardItemProtocol!
    var column:MapColumn!
    let viewItem:ViewBoardItem
    let dragItem:MapItemProtocol
    
    required init() {
        self.viewItem = ViewCard()
        self.dragItem = MapCard()
        self.dragItem.view = self.viewItem
    }
    
    func configureContent() {
        let viewItem:ViewCard = self.viewItem as! ViewCard
        let viewModel:ViewModelCard = self.viewModel as! ViewModelCard
        viewItem.identifier = viewModel.identifier
        viewItem.labelContent.text = viewModel.content
    }
}
