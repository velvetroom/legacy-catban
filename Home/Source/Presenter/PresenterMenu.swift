import Foundation
import Shared

class PresenterMenu {
    weak var view:Shared.View!
    weak var controller:Controller!
    weak var viewMenu:ViewMenu?

    func show() {
        let viewMenu:ViewMenu = ViewMenu()
        viewMenu.presenter = self
        self.viewMenu = viewMenu
        self.view.present(viewMenu, animated:false, completion:nil)
    }
    
    func close() {
        self.closeWith(completion:nil)
    }
    
    func openProjects() {
        self.closeWith { [weak self] in
            self?.controller.openProjects()
        }
    }
    
    func openAbout() {
        self.closeWith { [weak self] in
            self?.controller.createNewCard()
        }
    }
    
    private func closeWith(completion:(() -> Void)?) {
        self.viewMenu?.animateClose()
        let deadline:DispatchTime = DispatchTime.now() + ViewConstants.Menu.menuDismissTimeout
        DispatchQueue.main.asyncAfter(deadline:deadline) { [weak self] in
            self?.view.dismiss(animated:false, completion:nil)
            completion?()
        }
    }
}
