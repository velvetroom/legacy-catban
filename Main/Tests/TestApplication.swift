import XCTest
@testable import Main

class TestApplication:XCTestCase {
    private var app:Application!
    
    override func setUp() {
        super.setUp()
        self.app = Application()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.app, "Failed to load app")
    }
}
