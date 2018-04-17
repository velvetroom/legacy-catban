import XCTest
@testable import catban

class TestFile_LoadProjects:XCTestCase {
    private var model:File!
    
    override func setUp() {
        super.setUp()
        self.model = File()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.model, "Failed to load model")
    }
}
