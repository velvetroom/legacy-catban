import UIKit
import Board
import Shared

class Navigation:NavigationProtocol {
    weak var view:NavigationView!

    func launch() -> UIWindow {
        let view:NavigationView = NavigationView()
        let window:UIWindow = NavigationFactory.newWindow()
        window.rootViewController = view
        self.view = view
        self.transitionToLoad()
        return window
    }
    
    func transitionToLoad() {
        let view:PresentingViewProtocol = Configuration.viewLoadType.init()
        self.transitionTo(view:view)
    }
    
    func transitionToHome(project:ProjectManagedProtocol) {
        let view:PresentingViewProtocol = Configuration.viewHomeType.init()
        var interactor:InteractorProjectProtocol = view.interactor as! InteractorProjectProtocol
        interactor.project = project
        self.transitionTo(view:view)
    }
    
    func transitionToProjects(board:BoardProjectsProtocol) {
        let view:PresentingViewProtocol = Configuration.viewProjectsType.init()
        var interactor:InteractorBoardProtocol = view.interactor as! InteractorBoardProtocol
        interactor.board = board
        self.transitionTo(view:view)
    }
    
    func transitionTo(card:CardProtocol, in project:ProjectManagedProtocol) {
        let view:PresentingViewProtocol = Configuration.viewCardType.init()
        var interactor:InteractorCardProtocol = view.interactor as! InteractorCardProtocol
        interactor.project = project
        interactor.card = card
        self.transitionTo(view:view)
    }
    
    func transitionTo(column:ColumnProtocol, in project:ProjectManagedProtocol) {
        let view:PresentingViewProtocol = Configuration.viewColumnType.init()
        var interactor:InteractorColumnProtocol = view.interactor as! InteractorColumnProtocol
        interactor.project = project
        interactor.column = column
        self.transitionTo(view:view)
    }
    
    func present(view:PresentingViewProtocol) {
        view.transition = self
        self.view.present(view:view)
    }
    
    func pushTo(view:PresentingViewProtocol) {
        view.transition = self
        self.view.pushTo(view:view)
    }
    
    func pop() {
        self.view.pop()
    }
    
    func dismiss() {
        self.view.dismiss()
    }
    
    func transitionTo(view:PresentingViewProtocol) {
        view.transition = self
        self.view.transitionTo(view:view)
    }
}
