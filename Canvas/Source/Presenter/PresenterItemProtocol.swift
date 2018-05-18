import Foundation

protocol PresenterItemProtocol {
    var viewBoard:ViewBoard! { get set }
    var viewModel:ViewModelProtocol! { get set }
    var column:MapColumn! { get set }
    var viewItem:ViewBoardItem { get }
    var mapItem:MapItemProtocol { get }
    
    init()
    func configureContent()
}
