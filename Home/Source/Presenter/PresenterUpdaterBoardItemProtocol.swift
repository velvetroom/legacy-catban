import Foundation

protocol PresenterUpdaterBoardItemProtocol {
    var viewBoard:ViewBoard! { get set }
    var viewModel:ViewModelBoardItemProtocol! { get set }
    var column:DragColumn! { get set }
    var viewItem:ViewBoardItem { get }
    var dragItem:DragItemProtocol { get }
    
    init()
    func configureContent()
}
