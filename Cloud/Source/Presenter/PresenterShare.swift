import Foundation
import CleanArchitecture
import Architecture

class PresenterShare:PresenterProtocol {
    weak var transition:TransitionProtocol?
    weak var view:ViewProtocol?
    var interactor:Interactor!
    var viewModel:ViewModel!
    
    required init() { }
}
