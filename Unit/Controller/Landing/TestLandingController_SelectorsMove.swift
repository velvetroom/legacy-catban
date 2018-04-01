import XCTest
@testable import catban

class TestLandingController_SelectorsMove:XCTestCase {
    private var controller:LandingController!
    private var model:MockLandingProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.model = MockLandingProtocol()
        self.controller.model = self.model
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testSelectorMoveRight() {
        self.startExpectation()
        self.model.onMoveCardRight = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.moveEditingCardRight(sender:UIButton())
        
        self.waitExpectations()
    }
    
    func testSelectorMoveLeft() {
        self.startExpectation()
        self.model.onMoveCardLeft = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.moveEditingCardLeft(sender:UIButton())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}