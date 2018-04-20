import Foundation

extension ApplicationNavigationController {
    func transitionToLandingWith(board:BoardProtocol, animated:Bool = true) {
        let controller:LandingController = LandingController()
        controller.model.board = board
        self.setViewControllers([controller], animated:animated)
    }
}
