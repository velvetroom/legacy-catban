import Foundation
import Shared
import Tools

extension Presenter:PresenterDeleteDelegateProtocol {
    func delete() {
        var viewModel:DeleterViewModel = DeleterViewModel()
        let view:PresentingViewProtocol = DeleterFactory.makeWith(interactor:self.interactor, and:viewModel)
        self.transition?.present(view:view)
    }
    
    public func deleteConfirm() {
//        self.interactor.deleteProjectWith(identifier:self.list.selected.identifier)
    }
}
