import UIKit
import Board
import Shared

class Navigation:NavigationProtocol {
    var view:UINavigationController!
    var controller:ControllerProtocol!
    private var animated:Bool {
        get {
            return self.view.viewControllers.count > 0
        }
    }
    
    func launch() -> UIWindow {
        self.view = NavigationView()
        let window:UIWindow = NavigationFactory.newWindow()
        window.rootViewController = self.view
        self.transitionToLoad()
        return window
    }
    
    func transitionToLoad() {
        let controller:ControllerProtocol = ControllerFactory.factoryLoad()
        self.transitionTo(controller:controller)
    }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        let controller:ControllerProjectProtocol = ControllerFactory.factoryHome()
        controller.project = project
        self.transitionTo(controller:controller)
    }
    
    func transitionTo(controller:ControllerProtocol) {
        self.controller = controller
        self.controller.transiton = self
        self.view.setViewControllers([self.controller.presenter.view], animated:self.animated)
    }
}
