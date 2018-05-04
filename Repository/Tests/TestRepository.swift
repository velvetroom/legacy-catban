import XCTest
@testable import Repository

class TestRepository:XCTestCase {
    private var model:Repository!
    
    override func setUp() {
        super.setUp()
        self.model = Repository()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
