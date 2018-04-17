import XCTest
@testable import catban

class TestFile_LoadUser:XCTestCase {
    private var model:File!
    
    override func setUp() {
        super.setUp()
        self.model = File()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
