import XCTest
import Shared
@testable import Repository

class TestRepository:XCTestCase {
    private var model:Repository!
    
    override func setUp() {
        super.setUp()
        Configuration.directoryRoot = "test"
        self.model = Repository()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
