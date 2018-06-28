import UIKit
import CleanArchitecture
import Board
import Architecture
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
        let view:ViewProtocol = Configuration.viewLoadType.init()
        self.transitionTo(view:view)
    }
    
    func transitionToHome(board:BoardProtocol, project:ProjectProtocol) {
        let view:ViewProtocol = Configuration.viewHomeType.init()
        let interactor:InteractorProjectProtocol = view.interactor as! InteractorProjectProtocol
        interactor.board = board
        interactor.project = project
        self.transitionTo(view:view)
    }
    
    func transitionToProjects(board:BoardProtocol) {
        let view:ViewProtocol = Configuration.viewProjectsType.init()
        let interactor:InteractorBoardProtocol = view.interactor as! InteractorBoardProtocol
        interactor.board = board
        self.transitionTo(view:view)
    }
    
    func transitionTo(card:CardProtocol, board:BoardProtocol, project:ProjectProtocol) {
        let view:ViewProtocol = Configuration.viewCardType.init()
        let interactor:InteractorCardProtocol = view.interactor as! InteractorCardProtocol
        interactor.board = board
        interactor.project = project
        interactor.card = card
        self.transitionTo(view:view)
    }
    
    func transitionTo(column:ColumnProtocol, board:BoardProtocol, project:ProjectProtocol) {
        let view:ViewProtocol = Configuration.viewColumnType.init()
        let interactor:InteractorColumnProtocol = view.interactor as! InteractorColumnProtocol
        interactor.board = board
        interactor.project = project
        interactor.column = column
        self.transitionTo(view:view)
    }
    
    func present(view:ViewProtocol) {
        self.injectTransition(view:view)
        self.view.present(view:view)
    }
    
    func pushTo(view:ViewProtocol) {
        self.injectTransition(view:view)
        self.view.pushTo(view:view)
    }
    
    func pop() {
        self.view.pop()
    }
    
    func dismiss() {
        self.view.dismiss()
    }
    
    func transitionTo(view:ViewProtocol) {
        self.injectTransition(view:view)
        self.view.transitionTo(view:view)
    }
    
    private func injectTransition(view:ViewProtocol) {
        guard
            var view:ViewNavigationProtocol = view as? ViewNavigationProtocol
        else { return }
        view.navigation = self
    }
}
