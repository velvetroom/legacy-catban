import Foundation
import CleanArchitecture
import Architecture

class DeleterPresenter<Interactor:DeleterInteractorProtocol>:PresenterProtocol {
    weak var view:ViewProtocol?
    weak var transition:TransitionProtocol?
    var interactor:Interactor!
    var viewModel:ViewModel!
    
    required init() { }
    
    func confirm() {
        self.interactor.deleteConfirmed()
    }
    
    func cancel() {
        self.interactor.deleteCancelled()
    }
}
