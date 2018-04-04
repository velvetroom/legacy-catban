import XCTest
@testable import catban

class TestWriterController:XCTestCase {
    private var controller:WriterController!
    private var model:Writer!
    private struct Constants {
        static let text:String = "lorem ipsum"
    }
    
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
        self.model.text = Constants.text
    }
    
    func testLoad() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
        XCTAssertNotNil(self.controller.view, "Failed to load view")
        XCTAssertNotNil(self.controller.model, "Failed to load model")
        XCTAssertNotNil(self.outletsList.viewText, "Failed to load view text")
        XCTAssertNotNil(self.outletsList.viewText?.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.outletsList.layoutBarBottom, "Failed to load constraints")
        XCTAssertEqual(self.outletsList.viewText?.text, Constants.text, "Failed to update view text")
    }
}
