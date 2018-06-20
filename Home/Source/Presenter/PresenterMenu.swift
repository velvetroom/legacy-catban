import Foundation
import Shared

class PresenterMenu:PresenterProtocol {
    weak var interactor:Interactor!
    weak var presenting:PresentingViewProtocol?
    var viewModel:ViewModel!

    required init() { }
    
    func show() {
//        let viewMenu:ViewMenu = ViewMenu()
//        viewMenu.presenter = self
//        self.viewMenu = viewMenu
//        self.view.present(viewMenu, animated:false, completion:nil)
    }
    
    func close() {
        self.closeWith(completion:nil)
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
