import UIKit
import Shared
import Load

class Navigation:NavigationProtocol {
    var view:UINavigationController!
    
    func launch() -> UIWindow {
        let window:UIWindow = NavigationFactory.newWindow()
        self.view = NavigationFactory.newView()
        window.rootViewController = self.view
        self.navigateToFirstController()
        return window
    }
    
    func navigateTo(controller:ControllerProtocol) {
        self.view.setViewControllers([controller.presenter.view], animated:false)
    }
    
    private func navigateToFirstController() {
        let controller:ControllerProtocol = Load.Controller()
        self.navigateTo(controller:controller)
    }
}
