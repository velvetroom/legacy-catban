import XCTest
@testable import catban

class TestStats:XCTestCase {
    private var model:Stats!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Stats()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load stats")
        XCTAssertNotNil(self.model.presenter, "Failed to load presenter")
    }
    
    func testReloadViewModel() {
        self.startExpectation()
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
