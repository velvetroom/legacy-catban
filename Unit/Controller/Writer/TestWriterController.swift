import XCTest
@testable import catban

class TestWriterController:XCTestCase {
    private var controller:WriterController!
    private var model:Writer!
    
    override func setUp() {
        super.setUp()
        self.controller = WriterController()
        self.model = Writer()
        self.controller.model = self.model
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertNotNil(self.controller.model, "Failed to load model")
        XCTAssertNotNil(self.controller.viewText, "Failed to load view")
    }
}
