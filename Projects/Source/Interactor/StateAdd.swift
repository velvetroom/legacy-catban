import Foundation
import Board
import Shared
import Tools

class StateAdd:StateProtocol {
    func openNamer(interactor:Interactor) {
        var viewModel:NamerViewModelContent = NamerViewModelContent()
        viewModel.title = String.localized(key:"StateAdd_ViewModel_Title", in:type(of:self))
        let namer:PresentingViewProtocol = NamerFactory.makeWith(interactor:interactor, and:viewModel)
        interactor.presenter?.transition?.pushTo(view:namer)
    }
    
    func namerFinishedWith(name:String, interactor:Interactor) {
        let project:ProjectProtocol = ProjectFactory.newProject()
        project.name = name
        interactor.add(project:project)
    }
}
