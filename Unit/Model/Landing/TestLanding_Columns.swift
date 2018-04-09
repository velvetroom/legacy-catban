import XCTest
@testable import catban

class TestLanding_Columns:XCTestCase {
    private var model:Landing!
    private var project:MockProjectProtocol!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let columnIndex:Int = 993
    }
    
    override func setUp() {
        super.setUp()
        self.model = Landing()
        self.project = MockProjectProtocol()
        self.model.project = self.project
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testColumnAtIndex() {
        self.startExpectation()
        self.project.onColumnAtIndex = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.columnIndex, "Invalid index requested")
            self?.expect?.fulfill()
        }
        
        let _:ProjectColumn = self.model.columnAt(index:Constants.columnIndex)
        
        self.waitExpectations()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectations() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
