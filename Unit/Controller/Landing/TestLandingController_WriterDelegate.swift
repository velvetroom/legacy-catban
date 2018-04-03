import XCTest
@testable import catban

class TestLandingController_WriterDelegate:XCTestCase {
    private var controller:LandingController!
    private var model:Writer!
    
    override func setUp() {
        super.setUp()
        self.controller = LandingController()
        self.model = Writer()
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.model, "Failed to create model")
    }
    
    func testWriterFinished() {
        self.controller.writerFinished(model:self.model)
    }
}
