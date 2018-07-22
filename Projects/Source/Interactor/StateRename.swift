import Foundation
import CleanArchitecture
import Board
import Architecture
import Shared
import Tools

class StateRename:StateProtocol {
    weak var project:ProjectProtocol!
    
    func openNamer(interactor:Interactor) {
        var viewModel:NamerViewModelContent = NamerViewModelContent()
        viewModel.currentName = self.project.name
        viewModel.title = String.localized(key:"StateRename_ViewModel_Title", in:type(of:self))
        let namer:ViewProtocol = NamerFactory.makeWith(interactor:interactor, and:viewModel)
        interactor.presenter?.startTransition { (transition:TransitionProtocol) in
            transition.pushTo(view:namer)
        }
    }
    
    func namerFinishedWith(name:String, interactor:Interactor) {
        self.project.name = name
        interactor.updated(project:self.project)
        interactor.stateDefault()
    }
}
