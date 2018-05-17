import Foundation

protocol PresenterUpdaterProtocol {
    var outlets:PresenterOutlets! { get set }
    var viewModel:ViewModel! { get set }
    var drag:Map! { get set }
    
    init()
    func update()
}
