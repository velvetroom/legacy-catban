import XCTest
@testable import catban

class TestLoadController:XCTestCase {
    private var controller:LoadController!
    private var model:MockLoadProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LoadController()
        self.model = MockLoadProtocol()
        self.controller.model = self.model
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.model, "Failed to load model")
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
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
