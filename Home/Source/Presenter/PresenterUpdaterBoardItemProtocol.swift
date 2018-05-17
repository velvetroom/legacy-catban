import Foundation

protocol PresenterUpdaterBoardItemProtocol {
    var viewBoard:ViewBoard! { get set }
    var viewModel:ViewModelBoardItemProtocol! { get set }
    var column:MapColumn! { get set }
    var viewItem:ViewBoardItem { get }
    var dragItem:MapItemProtocol { get }
    
    init()
    func configureContent()
}
