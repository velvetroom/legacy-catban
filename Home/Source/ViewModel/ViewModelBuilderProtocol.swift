import Foundation
import Board

protocol ViewModelBuilderProtocol {
    var project:ProjectManagedProtocol! { get set }
    var viewModel:ViewModel! { get set }
    
    init()
    func build()
}
