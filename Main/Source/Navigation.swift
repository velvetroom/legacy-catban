import UIKit
import Board
import Shared

class Navigation:NavigationProtocol {
    var view:UINavigationController!
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
        let view:View = Configuration.viewLoadType.init()
        self.transitionTo(view:view)
    }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        let view:ViewProject = Configuration.viewHomeType.init()
        view.project = project
        self.transitionTo(view:view)
    }
    
    func transitionToProjects(board:BoardProjectsProtocol) {
        let view:ViewBoard = Configuration.viewProjectsType.init()
        view.board = board
        self.transitionTo(view:view)
    }
    
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) {
        let view:ViewCard = Configuration.viewCardType.init()
        view.project = project
        view.card = card
        self.transitionTo(view:view)
    }
    
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) {
        let view:ViewColumn = Configuration.viewColumnType.init()
        view.project = project
        view.column = column
        self.transitionTo(view:view)
    }
    
    func transitionTo(view:View) {
        view.transition = self
        self.view.setViewControllers([view], animated:self.animated)
    }
}
