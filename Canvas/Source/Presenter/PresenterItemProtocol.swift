import Foundation

protocol PresenterItemProtocol {
    var viewBoard:ViewContainer! { get set }
    var viewModel:ViewModelProtocol! { get set }
    var column:MapColumn! { get set }
    var viewItem:ViewItem { get }
    var mapItem:MapItemProtocol { get }
    
    init()
    func configureContent()
}
