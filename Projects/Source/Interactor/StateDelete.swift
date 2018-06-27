import Foundation
import CleanArchitecture
import Board
import Shared
import Tools

class StateDelete:StateProtocol {
    weak var project:ProjectProtocol!
    
    func openDeleter(interactor:Interactor) {
        var viewModel:DeleterViewModel = DeleterViewModel()
        viewModel.name = self.project.name
        viewModel.title = String.localized(key:"StateDelete_ViewModel_Title", in:type(of:self))
        let deleter:ViewProtocol = DeleterFactory.makeWith(interactor:interactor, and:viewModel)
        interactor.presenter?.shouldTransition { (transition:TransitionProtocol?) in
            transition?.present(view:deleter)
        }
    }
    
    func deleterConfirmed(interactor:Interactor) {
        interactor.delete(project:self.project)
        interactor.stateDefault()
    }
}
