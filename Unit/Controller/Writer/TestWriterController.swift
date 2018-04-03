import XCTest
@testable import catban

class TestWriterController:XCTestCase {
    private var controller:WriterController!
    private var model:Writer!
    
    private var outletsList:WriterPresenterOutletsList {
        get {
            return self.controller.model.presenter.outlets.list
        }
    }
    
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
        XCTAssertNotNil(self.outletsList.viewText, "Failed to load view text")
        XCTAssertNotNil(self.outletsList.layoutTextBottom, "Failed to load constraints")
    }
}
