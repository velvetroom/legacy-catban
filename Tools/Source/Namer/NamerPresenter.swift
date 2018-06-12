import Foundation
import Shared

class NamerPresenter<Interactor:NamerInteractorProtocol>:PresenterProtocol {
    weak var presenting:PresentingViewProtocol?
    var interactor:Interactor!
    var viewModel:NamerViewModel!
    
    required init() { }
}
