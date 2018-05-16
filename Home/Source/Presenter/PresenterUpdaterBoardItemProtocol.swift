import Foundation

protocol PresenterUpdaterBoardItemProtocol {
    var controller:Controller! { get set }
    var viewBoard:ViewBoard! { get set }
    var viewModel:ViewModelBoardItemProtocol! { get set }
    var drag:Drag! { get set }
    
    init()
    func factoryView()
}
