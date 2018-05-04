import UIKit
import Shared

class Navigation:NavigationProtocol {
    var view:UINavigationController!
    
    func launch() -> UIWindow {
        self.view = NavigationView()
        let window:UIWindow = NavigationFactory.newWindow()
        window.rootViewController = self.view
        self.transitionToLoad()
        return window
    }
    
    func transitionToLoad() {
        var controller:ControllerProtocol = ControllerFactory.factoryLoad()
        controller.transiton = self
        self.view.setViewControllers([controller.presenter.view], animated:false)
    }
    
    func transitionToHome() {
        var controller:ControllerProtocol = ControllerFactory.factoryHome()
        controller.transiton = self
        self.view.setViewControllers([controller.presenter.view], animated:false)
    }
}
