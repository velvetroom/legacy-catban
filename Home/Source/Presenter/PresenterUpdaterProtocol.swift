import Foundation

protocol PresenterUpdaterProtocol {
    var outlets:PresenterOutlets { get set }
    var viewModel:ViewModel { get set }
    
    func update()
}
