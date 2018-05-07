import XCTest
@testable import Board

class TestProject:XCTestCase {
    private var model:Project!
    
    override func setUp() {
        super.setUp()
        self.model = Project()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
        XCTAssertNotNil(self.model.countColumns, "Failed to load count columns")
        XCTAssertNotNil(self.model.columns, "Failed to load columns")
        XCTAssertNotNil(self.model.name, "Failed to load name")
    }
}
