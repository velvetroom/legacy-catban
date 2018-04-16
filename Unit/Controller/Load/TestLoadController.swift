import XCTest
@testable import catban

class TestLoadController:XCTestCase {
    private var controller:LoadController!
    private var model:MockLoadProtocol!
    private var navigation:MockNavigationController!
    private var board:Board!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LoadController()
        self.model = MockLoadProtocol()
        self.navigation = MockNavigationController()
        self.board = Board()
        self.controller.model = self.model
        self.navigation.addChildViewController(self.controller)
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.navigation, "Failed to load navigation")
        XCTAssertNotNil(self.board, "Failed to load board")
    }
    
    func testAddTitle() {
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertNotNil(self.controller.title, "Failed to assign title")
    }
    
    func testLoadBoardOnViewDidLoad() {
        self.startExpectation()
        self.model.onLoadBoard = { [weak self] in
            self?.expect?.fulfill()
        }
        
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        
        self.waitExpectations()
    }
    
    func testLoadBoardPresentsLanding() {
        self.startExpectation()
        self.navigation.onSetControllers = { [weak self] (controllers:[UIViewController]) in
            let controller:LandingController? = controllers.first as? LandingController
            XCTAssertNotNil(controller, "Invalid controller type received")
            self?.expect?.fulfill()
        }
        
        self.controller.openLanding(board:self.board)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
