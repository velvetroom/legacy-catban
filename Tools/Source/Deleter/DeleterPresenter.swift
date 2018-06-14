import Foundation
import Shared

class DeleterPresenter<Interactor:DeleterInteractorProtocol>:PresenterProtocol {
    typealias ViewModel = DeleterViewModel
    weak var presenting:PresentingViewProtocol?
    var interactor:Interactor!
    
    required init() { }
    
    func confirm() {
        self.interactor.deleteConfirmed()
    }
}
