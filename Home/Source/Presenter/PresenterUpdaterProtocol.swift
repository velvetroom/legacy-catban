import Foundation

protocol PresenterUpdaterProtocol {
    var outlets:PresenterOutlets! { get set }
    var viewModel:ViewModel! { get set }
    var controller:Controller! { get set }
    
    init()
    func update()
}
