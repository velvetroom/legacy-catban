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
        XCTAssertNotNil(self.model.identifier, "Failed to load identifier")
        XCTAssertNotNil(self.model.created, "Failed to load created")
    }
}
