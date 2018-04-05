import XCTest
@testable import catban

class TestLandingController_Selectors:XCTestCase {
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
    
    func testSelectorCloseEditingCard() {
        self.startExpectation()
        self.model.onClearCardSelection = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.selectorCloseEditingCard(sender:UIButton())
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
