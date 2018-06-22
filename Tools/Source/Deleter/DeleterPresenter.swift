import Foundation
import Shared

class DeleterPresenter<Interactor:DeleterInteractorProtocol>:PresenterProtocol {
    weak var view:ViewProtocol?
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
