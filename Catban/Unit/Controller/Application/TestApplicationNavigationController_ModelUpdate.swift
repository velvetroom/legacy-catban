import XCTest
@testable import catban

class TestApplicationNavigationController_ModelUpdate:XCTestCase {
    private var controller:ApplicationNavigationController!
    private var board:Board!
    
    override func setUp() {
        super.setUp()
        self.controller = ApplicationNavigationController()
        self.board = Board()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.board, "Failed to loard board")
    }
    
    func testLanding() {
        self.controller.transitionToLandingWith(board:self.board)
        
        let controller:LandingController<Landing> = self.controller.viewControllers.first as!
            LandingController<Landing>
        let board:Board = controller.model.board as! Board
        
        XCTAssertTrue(board === self.board, "Failed to update model on transition")
    }
    
    func testOrganise() {
        self.controller.transitionToOrganiseWith(board:self.board)
        
        let controller:OrganiseController<Organise> = self.controller.viewControllers.first as!
            OrganiseController<Organise>
        let board:Board = controller.model.board as! Board
        
        XCTAssertTrue(board === self.board, "Failed to update model on transition")
    }
    
    func testStats() {
        self.controller.transitionToStatsWith(board:self.board)
        
        let controller:StatsController<Stats> = self.controller.viewControllers.first as!
            StatsController<Stats>
        let board:Board = controller.model.board as! Board
        
        XCTAssertTrue(board === self.board, "Failed to update model on transition")
    }
}
