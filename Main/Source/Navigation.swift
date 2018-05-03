import UIKit
import Shared

class Navigation:NavigationProtocol {
    var view:UINavigationController!
    
    func launch() -> UIWindow {
        let window:UIWindow = NavigationFactory.newWindow()
        self.view = NavigationFactory.newView()
        window.rootViewController = self.view
        return window
    }
    
    func navigateTo(controller:ControllerProtocol) {
        self.view.setViewControllers([controller.presenter.view], animated:true)
    }
}
