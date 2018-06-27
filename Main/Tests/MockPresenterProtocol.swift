import UIKit
import CleanArchitecture
import Architecture

class MockPresenterProtocol:PresenterProtocol {
    weak var view:ViewProtocol?
    weak var transition:TransitionProtocol?
    var interactor:MockInteractorProtocol!
    var viewModel:ViewModel!
    
    required init() { }
}
