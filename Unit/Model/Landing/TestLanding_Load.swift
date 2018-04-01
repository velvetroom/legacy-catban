import XCTest
@testable import catban

class TestLanding_Load:XCTestCase {
    private var model:Landing!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
    
    func testLoadProject() {
        self.startExpectation()
        
        self.model.loadProject { [weak self] (project:Project) in
            XCTAssertTrue(Thread.isMainThread, "Response should be on main thread")
            self?.expect?.fulfill()
        }
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
