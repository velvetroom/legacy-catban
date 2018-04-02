import XCTest
@testable import catban

class TestWriterController:XCTestCase {
    private var controller:WriterController!
    
    override func setUp() {
        super.setUp()
        self.controller = WriterController()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
}
