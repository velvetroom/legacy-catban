import Foundation

extension ApplicationNavigationController {
    func transitionToLandingWith(board:BoardProtocol) {
        let controller:LandingController<Landing> = LandingController<Landing>()
        controller.model.board = board
        self.setViewControllers([controller], animated:true)
    }
    
    func transitionToOrganiseWith(board:BoardProtocol) {
        let controller:OrganiseController<Organise> = OrganiseController<Organise>()
        controller.model.board = board
        self.setViewControllers([controller], animated:true)
    }
    
    func transitionToStatsWith(board:BoardProtocol) {
        let controller:StatsController<Stats> = StatsController<Stats>()
        controller.model.board = board
        self.setViewControllers([controller], animated:true)
    }
}
