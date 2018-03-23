import XCTest
@testable import catban

class TestProjectLoader:XCTestCase {
    private var loader:ProjectLoader!
    
    override func setUp() {
        super.setUp()
        self.loader = ProjectLoader()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.loader, "Failed to load loader")
    }
}
