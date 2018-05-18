import Foundation

protocol PresenterBuilderProtocol {
    var outlets:PresenterOutlets! { get set }
    var viewModel:ViewModel! { get set }
    var map:MapProtocol! { get set }
    
    init()
    func update()
}
