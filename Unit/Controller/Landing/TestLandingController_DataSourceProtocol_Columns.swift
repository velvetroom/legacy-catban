import XCTest
@testable import catban

class TestLandingController_DataSourceProtocol_Columns:XCTestCase {
    private var controller:LandingController<MockLandingProtocol>!
    private var column:ProjectColumn!
    private var expect:XCTestExpectation?
    private struct Constants {
        static let wait:TimeInterval = 0.3
        static let index:Int = 3245
    }
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController<MockLandingProtocol>()
        self.column = ProjectColumn()
        self.controller.model.returnColumnAtIndex = self.column
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.column, "Failed to load column")
    }
    
    func testColumnAtIndex() {
        let column:ProjectColumn = self.controller.columnAt(index:Constants.index)
        XCTAssertTrue(column === self.column, "Invalid column received")
    }
    
    func testColumnAtIndexReceivesColumnFromProject() {
        self.startExpectation()
        self.controller.model.onColumnAtIndex = { [weak self] (index:Int) in
            XCTAssertEqual(index, Constants.index, "Invalid index requested")
            self?.expect?.fulfill()
        }
        
        let _:ProjectColumn = self.controller.columnAt(index:Constants.index)
        
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.wait) { (error:Error?) in }
    }
}
