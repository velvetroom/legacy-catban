import Foundation

extension ApplicationNavigationController {
    func transitionToLandingWith(board:BoardProtocol) {
        let controller:LandingController = LandingController()
        controller.model.board = board
        self.setViewControllers([controller], animated:true)
    }
    
    func transitionToOrganise(board:BoardProtocol) {
        let controller:OrganiseController = OrganiseController()
        controller.model.board = board
        self.setViewControllers([controller], animated:true)
    }
}
