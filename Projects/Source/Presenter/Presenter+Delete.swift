import Foundation
import Tools

extension Presenter:PresenterDeleteDelegateProtocol {
    func delete() {
        var presenter:PresenterDeleteProtocol = PresenterDeleteFactory.makePresenter()
        presenter.delegate = self
        presenter.presentingView = self.presenting
//        presenter.itemName = self.list.selected.name
        presenter.askConfirmation()
    }
    
    public func deleteConfirm() {
//        self.interactor.deleteProjectWith(identifier:self.list.selected.identifier)
    }
}
