import Foundation

protocol PresenterUpdaterProtocol {
    var outlets:PresenterOutlets! { get set }
    var viewModel:ViewModel! { get set }
    var controller:Controller! { get set }
    var drag:Drag! { get set }
    
    init()
    func update()
}
