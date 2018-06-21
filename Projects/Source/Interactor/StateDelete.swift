import Foundation
import Board
import Shared
import Tools

class StateDelete:StateProtocol {
    weak var project:ProjectProtocol!
    
    func openDeleter(interactor:Interactor) {
        var viewModel:DeleterViewModel = DeleterViewModel()
        viewModel.name = self.project.name
        viewModel.title = String.localized(key:"StateDelete_ViewModel_Title", in:type(of:self))
        let deleter:PresentingViewProtocol = DeleterFactory.makeWith(interactor:interactor, and:viewModel)
        interactor.presenter?.transition?.pushTo(view:deleter)
    }
    
    func deleterConfirmed(interactor:Interactor) {
        interactor.delete(project:self.project)
        interactor.stateDefault()
    }
}
