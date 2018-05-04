import UIKit
import Shared

class Navigation:NavigationProtocol {
    var view:UINavigationController!
    
    required init() { }
    
    func launch() -> UIWindow {
        self.view = NavigationView()
        let window:UIWindow = NavigationFactory.newWindow()
        window.rootViewController = self.view
        self.navigateToFirstController()
        return window
    }
    
    func navigateTo(controller:ControllerProtocol) {
        self.view.setViewControllers([controller.presenter.view], animated:false)
    }
    
    private func navigateToFirstController() {
        let controller:ControllerProtocol = ControllerFactory.factoryLoad()
        self.navigateTo(controller:controller)
    }
}
