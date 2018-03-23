import XCTest
@testable import catban

class TestProjectLoader:XCTestCase {
    private var loader:ProjectLoader!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
    }
    
    override func setUp() {
        super.setUp()
        self.loader = ProjectLoader()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
    }
    
    func testLoadProject() {
        self.startExpectation()
        
        self.loader.load { [weak self] (project:Project) in
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
