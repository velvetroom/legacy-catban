import XCTest
@testable import catban

class TestLandingController_SelectorsMove:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<MockLandingProtocol>()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    func testSelectorMoveRight() {
        self.startExpectation()
        self.controller.model.onMoveCardRight = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorMoveEditingCardRight(sender:UIButton())
        
        self.waitExpectations()
    }
    
    func testSelectorMoveLeft() {
        self.startExpectation()
        self.controller.model.onMoveCardLeft = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorMoveEditingCardLeft(sender:UIButton())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
