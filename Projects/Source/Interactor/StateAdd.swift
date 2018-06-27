import Foundation
import CleanArchitecture
import Board
import Architecture
import Shared
import Tools

class StateAdd:StateProtocol {
    func openNamer(interactor:Interactor) {
        var viewModel:NamerViewModelContent = NamerViewModelContent()
        viewModel.title = String.localized(key:"StateAdd_ViewModel_Title", in:type(of:self))
        let namer:ViewProtocol = NamerFactory.makeWith(interactor:interactor, and:viewModel)
        interactor.presenter?.shouldTransition { (transition:TransitionProtocol?) in
            transition?.pushTo(view:namer)
        }
    }
    
    func namerFinishedWith(name:String, interactor:Interactor) {
        let project:ProjectProtocol = ProjectFactory.newProject()
        project.name = name
        interactor.add(project:project)
        interactor.stateDefault()
    }
}
