import Foundation

extension ApplicationNavigationController {
    func transitionToLandingWith(board:BoardProtocol) {
        let controller:LandingController<Landing> = LandingController<Landing>()
        controller.model.board = board
        self.setViewControllers([controller], animated:true)
    }
    
    func transitionToOrganise(board:BoardProtocol) {
        let controller:OrganiseController<Organise> = OrganiseController<Organise>()
        controller.model.board = board
        self.setViewControllers([controller], animated:true)
    }
}
