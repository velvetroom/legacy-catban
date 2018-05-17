import Foundation

protocol PresenterUpdaterProtocol {
    var outlets:PresenterOutlets! { get set }
    var viewModel:ViewModel! { get set }
    var map:Map! { get set }
    
    init()
    func update()
}
