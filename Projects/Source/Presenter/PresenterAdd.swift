import Foundation
import CleanArchitecture
import Board
import Architecture
import Tools

class PresenterAdd:PresenterProtocol {
    weak var view:ViewProtocol?
    weak var transition:TransitionProtocol?
    var interactor:Interactor!
    var viewModel:ViewModel!
    
    required init() { }
}
