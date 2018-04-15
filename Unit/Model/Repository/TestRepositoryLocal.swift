import XCTest
@testable import catban

class TestRepositoryLocal:XCTestCase {
    private var model:RepositoryLocal!
    
    override func setUp() {
        super.setUp()
        self.model = RepositoryLocal()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
