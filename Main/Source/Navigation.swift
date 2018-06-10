import UIKit
import Board
import Shared

class Navigation:NavigationProtocol {
    var view:NavigationView!
    
    func launch() -> UIWindow {
        self.view = NavigationView()
        let window:UIWindow = NavigationFactory.newWindow()
        window.rootViewController = self.view
        self.transitionToLoad()
        return window
    }
    
    func transitionToLoad() {
        let view:PresentingViewProtocol = Configuration.viewLoadType.init()
        self.transitionTo(view:view)
    }
    
    func transitionToHome(project:ProjectManagedProtocol) {
//        let view:ViewProject = Configuration.viewHomeType.init()
//        view.project = project
//        self.transitionTo(view:view)
    }
    
    func transitionToProjects(board:BoardProjectsProtocol) {
//        let view:ViewBoardProtocol = Configuration.viewProjectsType.init()
//        view.board = board
//        self.transitionTo(view:view)
    }
    
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) {
//        let view:ViewCardProtocol = Configuration.viewCardType.init()
//        view.project = project
//        view.card = card
//        self.transitionTo(view:view)
    }
    
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) {
//        let view:ViewColumnProtocol = Configuration.viewColumnType.init()
//        view.project = project
//        view.column = column
//        self.transitionTo(view:view)
    }
    
    func transitionTo(view:PresentingViewProtocol) {
        view.transition = self
        self.view.transitionTo(view:view)
    }
}
