import Foundation
import CleanArchitecture
import Shared

class PresenterMenu:PresenterProtocol {
    weak var interactor:Interactor!
    weak var transition:TransitionProtocol?
    weak var view:ViewProtocol?
    var viewModel:ViewModel!

    required init() { }
    
    func close() {
        self.closeWith { [weak self] in
            self?.interactor.closedMenu()
        }
    }
    
    func openProjects() {
        self.closeWith { [weak self] in
            self?.interactor.openProjects()
        }
    }
    
    func openAbout() {
        self.closeWith { [weak self] in
            self?.interactor.createNewCard()
        }
    }
    
    private func closeWith(completion:(() -> Void)?) {
        let deadline:DispatchTime = DispatchTime.now() + ViewConstants.Menu.menuDismissTimeout
        DispatchQueue.main.asyncAfter(deadline:deadline) { [weak self] in
            self?.transition?.dismiss()
            completion?()
        }
    }
}
