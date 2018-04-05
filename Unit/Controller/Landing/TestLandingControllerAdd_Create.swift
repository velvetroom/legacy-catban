import XCTest
@testable import catban

class TestLandingControllerAdd_Create:XCTestCase {
    private var controller:LandingControllerAdd!
    private var model:MockLandingProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingControllerAdd()
        self.model = MockLandingProtocol()
        self.controller.model = self.model
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testCreateCard() {
        self.startExpectation()
        self.model.onCreateCard = { [weak self] in
            self?.expect?.fulfill()
        }
        
        self.controller.createCard()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
